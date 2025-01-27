import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';

class StreetnosheryProfileController extends GetxController {
  final allImages = CommonImages();
  final homeController = Get.find<StreetNosheryHomeController>();
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
  final TextEditingController nameController = TextEditingController();
  final userName = "".obs;
  final isUserDetailsValid = false.obs;
  final TextEditingController phoneController = TextEditingController();
  final selectedCountryCode = "+1".obs;  // Default country code
  final contactNumber = "".obs;

  void isValidDetails() {
    if(userName.isNotEmpty && isMobileNumberValid()) {
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
    phoneController.text = "";
    selectedCountryCode.value = "+1";  // Default country code
    contactNumber.value = "";
  }
}