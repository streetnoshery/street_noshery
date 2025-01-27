import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StreetnosheryAppReviewController extends GetxController {
  final selectedStars = 0.obs;
  TextEditingController reviewController = TextEditingController();


  void increaseStarCount(int index) {
    selectedStars.value = index + 1;
  }
}