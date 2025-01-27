import 'package:get/get.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';

class StreetNosheryOnboardingbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StreetNosheryOnboardingController());
  }

}