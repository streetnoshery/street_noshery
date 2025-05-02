import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_review_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_common_failure_bottomsheet.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/reviews/model/street_noshery_review_model.dart';
import 'package:street_noshery/reviews/provider/street_noshery_review_providers.dart';

class StreetnosheryAppReviewController extends GetxController {
  final selectedStars = 0.obs;
  TextEditingController reviewController = TextEditingController();
  final review = "".obs;
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
  StreetNosheryReviewFirebaseModel get streetNosheryReviewFirebasemodel =>
      onboardingController
          .fireBaseContentHandler.streetNosheryReviewFirebaseModel;
  StreetNosheryReviewmodel reviewmodel = StreetNosheryReviewmodel();
  final homeController = Get.find<StreetNosheryHomeController>();
  StreetNosheryReviewProviders streetNosheryReviewprovider = StreetNosheryReviewProviders();

  void increaseStarCount(int index) {
    selectedStars.value = index + 1;
  }

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> updateReview(num? rating, String? reviews) async {
    try {
      RepoResponse response = await streetNosheryReviewprovider.updateReview(
          customerId:
              onboardingController.streetNosheryUserData.value.customerId,
          shopId:
              onboardingController.streetNosheryUserData.value.address?.shopId,
          ratings: rating,
          reviews: reviews);
      if (response.data != null) {
        reviewmodel = response.data;
      }
    } catch (e) {
      hideLoader();
      StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "Review Submission Failed",
          errorSubtitle:
              "We couldn’t post your review right now. Please try again in a moment.",
        ),
      );

      throw e;
    }
  }
}
