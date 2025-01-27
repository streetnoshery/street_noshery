import 'package:get/get.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/profile/controllers/street_noshery_profile_controller.dart';

class StreetNosheryUserAddressController extends GetxController {
  RxString selectedAddress = "".obs;
  RxString phoneNumber = "".obs;
  final List<String> items = [
      "Jaipur",
      "Bangalore",
      "Mumbai"
    ];
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
  final profileController = Get.find<StreetnosheryProfileController>();

  @override
  void onReady() {
    selectedAddress.value = selectedAddress.value.isNotEmpty ? selectedAddress.value : onboardingController.address.value;
    phoneNumber.value = profileController.contactNumber.value.isNotEmpty ? profileController.contactNumber.value : onboardingController.contactNumber.value;
  }
}