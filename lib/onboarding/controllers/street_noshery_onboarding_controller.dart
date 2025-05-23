import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/firebase/firebase_helper.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_shops_firebase_model.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_common_failure_bottomsheet.dart';
import 'package:street_noshery/onboarding/enums/street_noshery_onboarding_status_enums.dart';
import 'package:street_noshery/onboarding/models/street_noshery_create_user_data_model.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';
import 'package:street_noshery/onboarding/providers/street_noshery_onboarding_providers.dart';
import 'package:street_noshery/routes/app_pages.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class StreetNosheryOnboardingController extends GetxController {
  final allImages = CommonImages();
  final theme = CommonTheme();
  final fireBaseContentHandler = Get.isRegistered<FirebaseHelper>()
      ? Get.find<FirebaseHelper>()
      : Get.put(FirebaseHelper());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final userName = "".obs;
  final address = StreetNosheryCreateuserDatamodel().obs;
  final isUserDetailsValid = false.obs;
  List<StreetNosheryShopsModelShop> get items =>
      fireBaseContentHandler.streetNosheryShopsFirebaseData;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final otp = "".obs;
  final selectedCountryCode = "+91".obs; // Default country code
  final contactNumber = "".obs;
  final isEmailEmpty = true.obs;
  final isEmailValid = true.obs;
  final isPasswordValid = true.obs;
  final isPasswordEmpty = true.obs;
  final box = Hive.box('myBox'); // Access the Hive box

  final showResendButton = false.obs;
  final countdown = 30.obs;
  Timer? timer;
  late AnimationController controller;
  late Animation<double> animation;
  final isOtpSent = false.obs;
  final isOtpVerify = false.obs;
  final customerId = "".obs;
  final isFirebaseDataChanged = false.obs;

  Rx<StreetNosheryUser> streetNosheryUserData = StreetNosheryUser().obs;
  StreetNosheryOnboardingProviders onboardingProvider =
      StreetNosheryOnboardingProviders();

  @override
  void onReady() async {
    await getHiveData();
    super.onReady();
  }

  Future<void> getHiveData() async {
    await Future.delayed(const Duration(seconds: 2)); // Add 2-second delay
    String mobileNumber =
        box.get('mobileNumber', defaultValue: 'No mobile number found');
    String customer = box.get('customerId', defaultValue: 'No customer found');
    if (mobileNumber.isEmpty ||
        mobileNumber == "No mobile number found" ||
        customer.isEmpty ||
        customer == "No customer found") {
      /* TODO: 1 
        Go to form mobile number screen for login
      */
      Get.toNamed(Routes.mobileView);
    } else {
      customerId.value = customer;
      final hashMobileNUmber = hashMobileNumber(mobileNumber);
      await fireBaseContentHandler.userFirebaseData(hashMobileNUmber);
      await Future.delayed(const Duration(seconds: 2));
      if (!isFirebaseDataChanged.value) {
        await getUser(mobileNumber);
      }
      if (streetNosheryUserData.value.status !=
          UserStatus.USER_DETAILS_VERIFICATION) {
        Get.toNamed(Routes.mobileView);
      } else {
        await onboardingStates();
      }
    }
  }

  void validateEmail({String? email}) {
    if (email == null || email.isEmpty) {
      isEmailEmpty.value = true;
      isEmailValid.value = true;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email ?? "")) {
      isEmailEmpty.value = false;
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }
  }

  bool validatepass({String? password}) {
    if (password == null || password.isEmpty) {
      isPasswordEmpty.value = true;
      return false;
    }
    isPasswordEmpty.value = false;
    if ((password.length) < 8 || (password.length) > 10) {
      return false;
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return false;
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return false;
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return false;
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return false;
    }
    return true;
  }

  void isValidDetails() {
    if ((address.value.firstLine?.isNotEmpty ?? false) && userName.isNotEmpty) {
      isUserDetailsValid.value = true;
    } else {
      isUserDetailsValid.value = false;
    }
  }

  bool isMobileNumberValid() {
    if (selectedCountryCode.value == "+91" &&
        contactNumber.value.length == 10) {
      return true;
    }
    return false;
  }

  void resetUserDetails() {
    isUserDetailsValid.value = false;
    nameController.text = "";
    userName.value = "";
    address.value = StreetNosheryCreateuserDatamodel();
  }

  void resetMobileNumber() {
    phoneController.text = "";
    selectedCountryCode.value = "+91"; // Default country code
    contactNumber.value = "";
    isOtpSent.value = false;
  }

  void resetOtp() {
    otpController.text = "";
    otp.value = "";
  }

  Future<bool> sendOTP(BuildContext context) async {
    startOtpTimer();
    try {
      showLoader();
      RepoResponse response = await onboardingProvider.generateOtp(
          mobileNumber: contactNumber.value,
          objective: StreetNosheryOnboardingEnums.MOBILE_VERIFICATION);
      if (response.data != null) {
        isOtpSent.value = true;
      }
      hideLoader();
      return isOtpSent.value;
    } catch (e) {
      hideLoader();
      return isOtpSent.value;
    }
  }

  void disposeTimer() {
    showResendButton.value = true;
    timer?.cancel();
  }

  void startOtpTimer() {
    countdown.value = 30;
    showResendButton.value = false;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        showResendButton.value = true;
        timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  Future<void> validateOtpAndSaveDetails() async {
    showLoader();
    final isOtpValid = await validateOtp();
    if (isOtpValid) {
      final isUserDetailsFind = await getUser(contactNumber.value);
      if (isUserDetailsFind) {
        hideLoader();
        await onboardingStates();
      } else {
        try {
          await savemobileDetails();
          hideLoader();
          Get.toNamed(Routes.emailPassword);
        } catch (e) {
          hideLoader();
          StreetNosheryCommonBottomSheet.show(
            child: const StreetNosheryCommonErrorBottomsheet(
              errorTitle: "Something Went Wrong",
              errorSubtitle:
                  "We're experiencing some issues at the moment. Please try again later.",
            ),
          );
          rethrow;
        }
      }
      storeMobileNumberInHive();
    } else {
      hideLoader();
      StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "OTP Validation Failed",
          errorSubtitle:
              "The OTP you entered is incorrect or has expired. Please try again or request a new OTP.",
        ),
      );
    }
  }

  Future<bool> validateOtp() async {
    try {
      showLoader();
      RepoResponse response = await onboardingProvider.verifyotp(
          mobileNumber: contactNumber.value,
          objective: StreetNosheryOnboardingEnums.MOBILE_VERIFICATION,
          otp: otp.value);
      if (response.data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void storeMobileNumberInHive() {
    box.put("mobileNumber", contactNumber.value);
    box.put("customerId", customerId.value);
  }

  Future<void> savemobileDetails() async {
    try {
      var data = StreetNosheryCreateuserDatamodel();
      data.mobileNumber = contactNumber.value;
      data.countryCode = selectedCountryCode.value;
      await createUser(data);
      disposeTimer();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveEmailDetails() async {
    try {
      var data = StreetNosheryCreateuserDatamodel();
      data.email = emailController.text;
      data.password = passwordController.text;
      data.mobileNumber = contactNumber.value;
      await createUser(data);
    } catch (e) {
      StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "Something Went Wrong",
          errorSubtitle:
              "We're experiencing some issues at the moment. Please try again later.",
        ),
      );
      rethrow;
    }
  }

  Future<void> saveuserDetails() async {
    try {
      var data = StreetNosheryCreateuserDatamodel();
      data.userName = userName.value;
      data.firstLine = address.value.firstLine;
      data.secondLine = address.value.secondLine;
      data.shopId = address.value.shopId;
      data.mobileNumber = contactNumber.value;
      await createUser(data);
    } catch (e) {
      StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "Something Went Wrong",
          errorSubtitle:
              "We're experiencing some issues at the moment. Please try again later.",
        ),
      );
      rethrow;
    }
  }

  Future<void> onboardingStates() async {
    if (streetNosheryUserData.value.status == UserStatus.MOBILE_VERIFICATION) {
      Get.toNamed(Routes.emailPassword);
    } else if (streetNosheryUserData.value.status ==
        UserStatus.EMAIL_VERIFICATION) {
      Get.toNamed(Routes.onboardingUserDetails);
    } else if (streetNosheryUserData.value.status ==
        UserStatus.USER_DETAILS_VERIFICATION) {
      Get.toNamed(Routes.home);
    }
  }

  Future<bool> getUser(String mobileNumber) async {
    try {
      RepoResponse response = await onboardingProvider.getUser(mobileNumber);
      if (response.data != null) {
        streetNosheryUserData.value = response.data;
        customerId.value = streetNosheryUserData.value.customerId ?? "";
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> createUser(StreetNosheryCreateuserDatamodel data) async {
    try {
      RepoResponse response = await onboardingProvider.createUser(data);
      if (response.data != null) {
        streetNosheryUserData.value = response.data;
        customerId.value = streetNosheryUserData.value.customerId ?? "";
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> checkExistingUser() async {
    try {
      showLoader();
    } catch (e) {
      rethrow;
    }
  }

  String hashMobileNumber(String mobileNumber) {
    return sha256.convert(utf8.encode(mobileNumber)).toString();
  }
}
