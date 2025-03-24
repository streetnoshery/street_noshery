import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_review_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/reviews/model/street_noshery_review_model.dart';
import 'package:street_noshery/reviews/provider/street_noshery_review_providers.dart';

class StreetnosheryAppReviewController extends GetxController {
  final selectedStars = 0.obs;
  TextEditingController reviewController = TextEditingController();
  final review = "".obs;
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
  StreetNosheryReviewFirebaseModel get streetNosheryReviewFirebasemodel => onboardingController.fireBaseContentHandler.streetNosheryReviewFirebaseModel;
  StreetNosheryReviewmodel reviewmodel = StreetNosheryReviewmodel();
  final homeController = Get.find<StreetNosheryHomeController>();

  void increaseStarCount(int index) {
    selectedStars.value = index + 1;
  }

  @override
  void onInit() async {
    await homeController.reviews();
    selectedStars.value = homeController.ratings.averageRating?.toInt() ?? 0;
    super.onInit();
  }

  Future<void> updateReview(num? rating, String? reviews) async {
    try {
      ApiResponse response = await StreetNosheryReviewProviders.updateReview(customerId: onboardingController.streetNosheryUserData.value.customerId, shopId: onboardingController.streetNosheryUserData.value.address?.shopId, ratings: rating, reviews: reviews);
      if(response.data != null){
        reviewmodel = StreetNosheryReviewmodel.fromJson(response.data);
      }
    } catch (e) {
      hideLoader();
      throw e;
    }
  }
}