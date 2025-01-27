import 'package:get/get.dart';

import '../controllers/street_noshery_profile_controller.dart';

class StreetNosheryProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreetnosheryProfileController>(() => StreetnosheryProfileController());
  }
}