import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_date_format.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/models/street_noshery_past_orders_model.dart';
import 'package:street_noshery/reviews/widget/street_noshery_common_review_dialogue_box.dart';
import 'package:street_noshery/profile/controllers/street_noshery_profile_controller.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryProfileView extends GetView<StreetnosheryProfileController> {
  const StreetNosheryProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = CommonTheme();
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), // Custom AppBar height
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: colorsTheme.theme.lightLeafGreen, // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 1, // Blur radius
                offset: const Offset(0, 4), // Offset in X and Y direction
              ),
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button at the left
                        IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: colorsTheme.theme.textPrimary),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        // Help button at the right
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.help);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  gradient: LinearGradient(
                                    colors: [
                                      colorsTheme.theme.lightGreen,
                                      colorsTheme.theme.lightMossgreen
                                    ], // Gradient colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )),
                              child: Text(
                                controller.streetNosheryProfileFireBaseModel
                                        .appbar?.help ??
                                    "Help",
                                style: TextStyle(
                                    color: colorsTheme.theme.textPrimary,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Text "Your Name Here" below the buttons
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      controller.userName.value.isNotEmpty
                          ? controller.userName.value
                          : controller.onboardingController
                                  .streetNosheryUserData.value.userName ??
                              "",
                      style: TextStyle(
                        color: colorsTheme.theme.textPrimary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      controller.contactNumber.value.isNotEmpty
                          ? controller.contactNumber.value
                          : controller.onboardingController
                                  .streetNosheryUserData.value.mobileNumber ??
                              "",
                      style: TextStyle(
                          color: colorsTheme.theme.textSecondary, fontSize: 15),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, bottom: 20),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: InkWell(
                //       onTap: () {
                //         Get.toNamed(Routes.editUserprofile);
                //       },
                //       child: Text(
                //         controller.streetNosheryProfileFireBaseModel.appbar
                //                 ?.editProfile
                //                 ?.toUpperCase() ??
                //             "EDIT PROFILE",
                //         style: const TextStyle(
                //           color: Colors.black,
                //           fontSize: 12,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: Visibility(
          visible: !(controller
                  .homeController.streetNosheryUser.value.isRegisterForShop ??
              false),
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: controller.homeController.foodCartList.isNotEmpty
                    ? () {
                        Get.toNamed(Routes.cart);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      controller.homeController.foodCartList.isNotEmpty
                          ? Colors.white
                          : Colors.black,
                  backgroundColor:
                      controller.homeController.foodCartList.isNotEmpty
                          ? Colors.black
                          : Colors.teal.shade400, // Text color
                  elevation: 5, // Shadow depth
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 12), // Padding
                  shape: RoundedRectangleBorder(
                    // Rounded corners
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  controller.streetNosheryProfileFireBaseModel
                          .primaryButtonTitle ??
                      "Cart >",
                  style: TextStyle(
                      fontSize: 15,
                      color: controller.homeController.foodCartList.isNotEmpty
                          ? colorsTheme.theme.surface
                          : colorsTheme.theme.textTer), // Text style
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                splashColor: Colors.transparent, // Removes the splash color
                highlightColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(Routes.userAccount);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body
                                  ?.accountSetting?.title ??
                              "My Account",
                          style: TextStyle(
                              color: colorsTheme.theme.textPrimary,
                              fontSize: 15),
                        ),
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body
                                  ?.accountSetting?.subTitle ??
                              "Settings",
                          style: TextStyle(
                              color: colorsTheme.theme.textSecondary,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Text(">",
                        style: TextStyle(
                            color: colorsTheme.theme.textSecondary,
                            fontSize: 20))
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                splashColor: Colors.transparent, // Removes the splash color
                highlightColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(Routes.userAddress);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body
                                  ?.addressSetting?.title ??
                              "Address",
                          style: TextStyle(
                              color: colorsTheme.theme.textPrimary,
                              fontSize: 15),
                        ),
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body
                                  ?.addressSetting?.subTitle ??
                              "Share, Edit & Add New Address",
                          style: TextStyle(
                              color: colorsTheme.theme.textSecondary,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Text(">",
                        style: TextStyle(
                            color: colorsTheme.theme.textSecondary,
                            fontSize: 20))
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                splashColor: Colors.transparent, // Removes the splash color
                highlightColor: Colors.transparent,
                onTap: () {
                  Get.toNamed(Routes.reviewApp);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body
                                  ?.review?.title ??
                              "Review",
                          style: TextStyle(
                              color: colorsTheme.theme.textPrimary,
                              fontSize: 15),
                        ),
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body
                                  ?.review?.subTitle ??
                              "Share App Reviews",
                          style: TextStyle(
                              color: colorsTheme.theme.textSecondary,
                              fontSize: 13),
                        )
                      ],
                    ),
                    Text(">",
                        style: TextStyle(
                            color: colorsTheme.theme.textSecondary,
                            fontSize: 20))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: !(controller.homeController.streetNosheryUser.value
                      .isRegisterForShop ??
                  false),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    controller.streetNosheryProfileFireBaseModel.body?.pastOrder
                            ?.toUpperCase() ??
                        "PAST ORDERS",
                    style: TextStyle(
                        color: colorsTheme.theme.textSecondary, fontSize: 15)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: (controller
                        .homeController.recentlyBroughtFoodItems.isEmpty &&
                    !(controller.homeController.streetNosheryUser.value
                            .isRegisterForShop ??
                        false)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(controller.streetNosheryProfileFireBaseModel.body
                          ?.emptyOrderTitle ??
                      "Order to remove your cravings",
                      style: TextStyle(
                        color: colorsTheme.theme.textSecondary, fontSize: 15)),
                )),
            Visibility(
              visible: !(controller.homeController.streetNosheryUser.value
                      .isRegisterForShop ??
                  false),
              child: Container(
                color: colorsTheme.theme.pageBackgroundColor,
                height: Get.height,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final foodList =
                          controller.homeController.recentlyBroughtFoodItems;
                      return StreetNosheryPastOrders(
                        foodList: foodList,
                        index: index,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 0.5,
                      );
                    },
                    itemCount: controller
                        .homeController.recentlyBroughtFoodItems.length),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      );
    });
  }
}

// ignore: must_be_immutable
class StreetNosheryPastOrders extends GetView<StreetNosheryHomeController> {
  List<StreetNosheryPastOrdersModel> foodList;
  int index;
  StreetNosheryPastOrders(
      {super.key, required this.foodList, required this.index});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = CommonTheme();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                controller
                    .getPastOrderDetails(foodList[index].orderItems ?? [])
                    .title,
                style: TextStyle(
                    color: colorsTheme.theme.textSecondary, fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                  "${controller.getPastOrderDetails(foodList[index].orderItems ?? []).rating}",
                  style: TextStyle(
                      color: colorsTheme.theme.textSecondary, fontSize: 15)),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.star, // Star icon
                color: colorsTheme.theme.yellowStar, // Icon color
                size: 15, // Icon size
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    Get.toNamed(Routes.orderTracking, arguments: {
                      'orderTrackId': foodList[index].orderTrackId,
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      ">",
                      style: TextStyle(
                          color: colorsTheme.theme.textPrimary, fontSize: 20),
                    ),
                  ))
              // Obx(() {
              //   return Visibility(
              //     visible: false,
              //     child: IconButton(
              //       icon: Icon(
              //         (controller.isFavorite.value && controller.tappedFoodId.value == foodList[index].dishId?.toInt())
              //             ? Icons.favorite
              //             : Icons.favorite_border,
              //         color: (controller.isFavorite.value && controller.tappedFoodId.value == foodList[index].dishId?.toInt())
              //             ? colors.darkLeafGreen
              //             : Colors.grey,
              //         size: 18,
              //       ),
              //       onPressed: () {
              //         if(controller.tappedFoodId.value == foodList[index].dishId?.toInt()) {
              //           controller.isFavorite.value = !controller.isFavorite.value;
              //         }
              //         else if(controller.tappedFoodId.value != foodList[index].dishId?.toInt()) {
              //           controller.isFavorite.value = true;
              //         }
              //         controller.tappedFoodId.value = foodList[index].dishId?.toInt() ?? 0;
              //         controller.updateFavoriteFood();
              //       },
              //     ),
              //   );
              // })
            ],
          ),
          Text(
            DateFormatter().orderDateFormat(foodList[index].orderPlacedAt),
            style: TextStyle(color: colorsTheme.theme.textTer, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.menu);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white),
                    child: Text(
                      controller.streetNosheryHomePageFirebaseModel
                              .recentBrought?.reorder
                              .toUpperCase() ??
                          "REORDER",
                      style: TextStyle(
                          color: colorsTheme.theme.textPrimary, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    List<num> foodIds =
                        controller.foodIds(foodList[index].orderItems ?? []);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReviewPopup(foodIds: foodIds);
                      },
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: colorsTheme.theme.orangeAccent),
                        color: Colors.white),
                    child: Text(
                      controller.streetNosheryHomePageFirebaseModel
                              .recentBrought?.rate
                              .toUpperCase() ??
                          "RATE ORDER",
                      style: TextStyle(
                          color: colorsTheme.theme.orangeAccent, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
