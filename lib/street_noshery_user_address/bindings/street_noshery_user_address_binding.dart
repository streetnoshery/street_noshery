

import 'package:get/get.dart';

import '../controllers/street_noshery_user_address_controller.dart';

class StreetNosheryUserAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreetNosheryUserAddressController>(() => StreetNosheryUserAddressController());
  }
}