import 'package:get/get.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';

class StreetNosheryHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StreetNosheryHomeController());
  }

}