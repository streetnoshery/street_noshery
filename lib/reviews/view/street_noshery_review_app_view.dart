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
    final colorsTheme = CommonTheme();
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.streetNosheryReviewFirebasemodel.title ?? "Rate and Review", style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),),
        backgroundColor: colorsTheme.theme.lightLeafGreen,
      ),
      backgroundColor: colorsTheme.theme.pageBackgroundColor,
      body: Obx(() {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "${controller.streetNosheryReviewFirebasemodel.ratings ?? "Rating"}(${controller.selectedStars.value}/5)",
                    style: TextStyle(color: colorsTheme.theme.textSecondary, fontSize: 15),
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
                                ? colorsTheme.theme.yellowStar
                                : colorsTheme.theme.greySecondary,
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
                    style: TextStyle(color: colorsTheme.theme.textSecondary, fontSize: 15),
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
                            color: colorsTheme.theme.darkLeafGreen, width: 2.0),
                      ),
                      hintText: controller.streetNosheryReviewFirebasemodel.reviewPrefilled ?? "Write your review here...",
                      labelStyle: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15)
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
                        highlightColor: colorsTheme.theme.surface,
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: colorsTheme.theme.textTer
                            )
                          ),
                          child: Text(controller.streetNosheryReviewFirebasemodel.secondaryCta ?? "Cancel", style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),),
                        ),
                      ),
                      InkWell(
                        onTap: (controller.selectedStars.value != 0 && controller.review.value.isNotEmpty) ? () async {
                          showLoader();
                          await controller.updateReview(controller.selectedStars.value,controller.review.value);
                          hideLoader();
                          Get.back();
                        } : null,
                        highlightColor: (controller.selectedStars.value != 0 && controller.review.value.isNotEmpty) ? Colors.teal.shade200 : Colors.grey.shade300,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: (controller.selectedStars.value != 0 && controller.review.value.isNotEmpty) ? colorsTheme.theme.lightLeafGreen : Colors.grey.shade300,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: colorsTheme.theme.textTer
                            )
                          ),
                          child: Text(controller.streetNosheryReviewFirebasemodel.primaryCta ?? "Post", style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),),
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
