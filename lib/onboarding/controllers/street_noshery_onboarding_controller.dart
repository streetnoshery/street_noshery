import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/firebase/firebase_helper.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryOnboardingController extends GetxController {
  final allImages = CommonImages();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final userName = "".obs;
  final address = "".obs;
  final isUserDetailsValid = false.obs;
  final List<String> items = [
      "Jaipur",
      "Bangalore",
      "Mumbai"
    ];
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final otp = "".obs;
  final selectedCountryCode = "+91".obs;  // Default country code
  final contactNumber = "".obs;
  final isEmailEmpty = true.obs;
  final isEmailValid = true.obs;
  final isPasswordValid = true.obs;
  final isPasswordEmpty = true.obs;
  final formKey = GlobalKey<FormState>();
  final box = Hive.box('myBox'); // Access the Hive box

  final showResendButton = false.obs;
  final countdown = 30.obs;
  Timer? timer;
  late AnimationController controller;
  late Animation<double> animation;
  final fireBaseContentHandler = Get.isRegistered<FirebaseHelper>() ? Get.find<FirebaseHelper>() : Get.put(FirebaseHelper());

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    getHiveData();
    super.onReady();
  }

  void getHiveData() async {
    await Future.delayed(const Duration(seconds: 2)); // Add 2-second delay
    String mobileNumber = box.get('mobileNumber', defaultValue: 'No username found');
    if(mobileNumber == "No username found") {
      /* TODO: 1 
        Go to form mobile number screen for login
      */
      Get.toNamed(Routes.mobileView);
    }
    else{
      await onboardingStates();
    }
  }

  Future<void> onboardingData() async {
    /* 
    TODO: API for user data
     */
  }

  void validateEmail({String? email}) {
    if (email == null || email.isEmpty) {
      isEmailEmpty.value = true;
      isEmailValid.value = true;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(email ?? "")) {
      isEmailEmpty.value = false;
      isEmailValid.value = false;
    }
    else{
      isEmailValid.value = true;
    }
  }

  bool validatepass({String? password}) {
    if (password == null ||  password.isEmpty) {
      isPasswordEmpty.value = true;
      return false;
    }
    isPasswordEmpty.value = false;
    if ((password.length)< 8 || (password.length) > 10) {
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
    if(address.isNotEmpty && userName.isNotEmpty) {
      isUserDetailsValid.value = true;
    }
    else {
      isUserDetailsValid.value = false;
    }
  }

  bool isMobileNumberValid() {
    if(selectedCountryCode.value == "+91" && contactNumber.value.length == 10) {
      return true;
    }
    return false;
  }

  void resetUserDetails() {
    isUserDetailsValid.value = false;
    nameController.text = "";
    userName.value = "";
    address.value = "";
  }

  void resetMobileNumber() {
    phoneController.text = "";
    selectedCountryCode.value = "+91";  // Default country code
    contactNumber.value = "";
  }

  void resetOtp() {
    otpController.text = "";
    otp.value = "";
  }

  Future<bool> sendOTP(BuildContext context ) async {
    startOtpTimer();
    /* 
    TODO: OTP send API call
    TODO: Error handling bottomsheet
     */
    return true;
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

  Future<bool> validateOtp() async {
    /* 
    TODO: OTP validate API call
    TODO: Error handling bottomsheet
     */
    return true;
  }

  void storeMobileNumberInHive() {
    box.put("mobileNumber", contactNumber.value);
  }

  Future<void> saveEmailDetails() async {
    /* 
    TODO: save email details API
    TODO: Error handling bottomsheet
     */
    Get.toNamed(Routes.onboardingUserDetails);
  }

  Future<void> saveuserDetails() async {
    /* 
    TODO: save user details API
    TODO: Error handling bottomsheet
     */
    Get.toNamed(Routes.home);
  }

  Future<void> onboardingStates() async {
    /* 
    TODO: Onboarding API call
    TODO: Error handling bottomsheet
     */
    /*
    1. StreetNosheryOnboardingEnums
    2. StreetNosheryOnboardingEnums
    3. StreetNosheryOnboardingEnums
    */
    /*
    if(PI data validation success) {
      Get.toNamed(Routes.home);
    }
     */
    Get.toNamed(Routes.home);
  }
}