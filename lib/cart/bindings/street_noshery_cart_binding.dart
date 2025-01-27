import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';

class StreetNosheryCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StreetNosheryCartController());
  }

}