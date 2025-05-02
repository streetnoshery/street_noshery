import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';

class ReviewPopup extends GetView<StreetNosheryHomeController> {
  final List<num> foodIds;
  const ReviewPopup({super.key, required this.foodIds});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = CommonTheme();
    return Obx(() {
      String review = controller.boxReview.value;
      return AlertDialog(
        backgroundColor: Colors.white, // Background color set to grey shade
        title: Text(
            controller.streetNosheryHomePageFirebaseModel.review?.title ??
                "Submit Review"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < controller.selectedStars.value
                          ? Icons.star
                          : Icons.star_border,
                      color: index < controller.selectedStars.value
                          ? colorsTheme.theme.yellowStar
                          : Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      controller.increaseStarCount(index);
                    },
                  );
                })),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.boxReviewController,
              maxLines: 4,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: controller.streetNosheryHomePageFirebaseModel.review
                        ?.textPrefiller ??
                    "Write your review here...",
              ),
              onChanged: (review) {
                controller.boxReview.value = review;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.boxReviewController.text = "";
              controller.selectedStars.value = 0;
              Get.back();
            },
            child: Text(
              controller.streetNosheryHomePageFirebaseModel.review
                      ?.cancelButton ??
                  "Cancel",
              style: const TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: (controller.shouldReviewButtonEnable(review))
                ? () async {
                    showLoader();
                    await controller.submitReviews(
                        review: review,
                        context: context,
                        rating: controller.selectedStars.value,
                        foodIds: foodIds);
                    hideLoader();
                  }
                : null,
            child: Text(
                controller.streetNosheryHomePageFirebaseModel.review?.submit ??
                    "Submit",
                style: const TextStyle(color: Colors.black)),
          ),
        ],
      );
    });
  }
}
