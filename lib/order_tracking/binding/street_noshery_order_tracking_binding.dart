import 'package:get/get.dart';
import 'package:street_noshery/order_tracking/controller/street_noshery_order_tracking_controller.dart';

class StreetNosheryOrderTrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StreetNosheryOrderTrackingController());
  }

}