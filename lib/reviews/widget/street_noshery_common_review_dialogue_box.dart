import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';

class ReviewPopup extends GetView<StreetNosheryHomeController> {

  const ReviewPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          Colors.white, // Background color set to grey shade
      title: const Text("Submit Review"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller.boxReviewController,
            maxLines: 4,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Write your review here...",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel", style: TextStyle(color: Colors.black),),
        ),
        ElevatedButton(
          onPressed: () {
            String review = controller.boxReviewController.text;
            controller.submitReviews(review, context);
          },
          child: const Text("Submit", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
