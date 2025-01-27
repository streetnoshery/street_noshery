import 'package:get/get.dart';
import 'package:street_noshery/menu/controller/street_noshery_menu_controller.dart';

class StreetNosheryMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreetNosheryMenuController>(() => StreetNosheryMenuController());
  }

}