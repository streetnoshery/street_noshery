import 'package:get/get.dart';
import 'package:street_noshery/reviews/controller/street_noshery_app_review_controller.dart';

class StreetNosheryAppReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StreetnosheryAppReviewController());
  }
}