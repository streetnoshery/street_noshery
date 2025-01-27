

import 'package:get/get.dart';

import '../controllers/street_noshery_user_account_controller.dart';

class StreetNosheryUserAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreetnosheryUserAccountController>(() => StreetnosheryUserAccountController());
  }
}