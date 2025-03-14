import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/reviews/controller/street_noshery_app_review_controller.dart';

class StreetNosheryAppReviewView
    extends GetView<StreetnosheryAppReviewController> {
  const StreetNosheryAppReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * .16,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: colors.lightLeafGreen,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight:
                            Radius.circular(30)), // Optional: Rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      Center(
                        child: Text(
                          controller.streetNosheryReviewFirebasemodel.title ?? "Rate and Review",
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${controller.streetNosheryReviewFirebasemodel.ratings ?? "Rating"}(${controller.selectedStars.value}/5)",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < controller.selectedStars.value
                                ? Icons.star
                                : Icons.star_border,
                            color: index < controller.selectedStars.value
                                ? colors.yellowStar
                                : Colors.grey,
                            size: 40,
                          ),
                          onPressed: () {
                            controller.increaseStarCount(index);
                          },
                        );
                      })),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    controller.streetNosheryReviewFirebasemodel.review ?? "Review",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: controller.reviewController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Colors.green.shade800, width: 2.0),
                      ),
                      hintText: controller.streetNosheryReviewFirebasemodel.reviewPrefilled ?? "Write your review here...",
                    ),
                    onChanged: (value) {
                      controller.review.value = value;
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        highlightColor: Colors.white,
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Colors.grey.shade400
                            )
                          ),
                          child: Text(controller.streetNosheryReviewFirebasemodel.secondaryCta ?? "Cancel", style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          showLoader(context);
                          await controller.updateReview(controller.selectedStars.value,controller.review.value);
                          hideLoader(context);
                        },
                        highlightColor: Colors.teal.shade200,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: colors.lightLeafGreen,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Colors.grey.shade400
                            )
                          ),
                          child: Text(controller.streetNosheryReviewFirebasemodel.primaryCta ?? "Post", style: TextStyle(color: Colors.black),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
