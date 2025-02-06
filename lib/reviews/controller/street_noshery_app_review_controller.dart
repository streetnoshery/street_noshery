import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_review_static_data.model.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';

class StreetnosheryAppReviewController extends GetxController {
  final selectedStars = 0.obs;
  TextEditingController reviewController = TextEditingController();
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
  StreetNosheryReviewFirebaseModel get streetNosheryReviewFirebasemodel => onboardingController.fireBaseContentHandler.streetNosheryReviewFirebaseModel;

  void increaseStarCount(int index) {
    selectedStars.value = index + 1;
  }
}