import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_date_format.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';
import 'package:street_noshery/reviews/widget/street_noshery_common_review_dialogue_box.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';
import 'package:street_noshery/profile/controllers/street_noshery_profile_controller.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryProfileView extends GetView<StreetnosheryProfileController> {
  const StreetNosheryProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150), // Custom AppBar height
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: colors.lightLeafGreen, // Shadow color
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
                    padding: const EdgeInsets.only(top: 30, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back button at the left
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
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
                                      colors.lightGreen,
                                      colors.lightMossgreen
                                    ], // Gradient colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )),
                              child: Text(
                                controller.streetNosheryProfileFireBaseModel.appbar?.help ?? "Help",
                                style: const TextStyle(color: Colors.black),
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
                          : controller.onboardingController.streetNosheryUserData.value.userName ?? "",
                      style: const TextStyle(
                        color: Colors.black,
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
                          : controller.onboardingController.streetNosheryUserData.value.mobileNumber ?? "",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.editUserprofile);
                      },
                      child: Text(
                        controller.streetNosheryProfileFireBaseModel.appbar?.editProfile?.toUpperCase() ?? "EDIT PROFILE",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                         controller.streetNosheryProfileFireBaseModel.body?.accountSetting?.title ?? "My Account",
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body?.accountSetting?.subTitle ?? "Settings",
                          style: TextStyle(color: Colors.grey.shade600),
                        )
                      ],
                    ),
                    Text(">",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 20))
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.5,
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
                        controller.streetNosheryProfileFireBaseModel.body?.addressSetting?.title ?? "Address",
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body?.addressSetting?.subTitle ?? "Share, Edit & Add New Address",
                          style: TextStyle(color: Colors.grey.shade600),
                        )
                      ],
                    ),
                    Text(">",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 20))
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 0.5,
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
                          controller.streetNosheryProfileFireBaseModel.body?.review?.title ??"Review",
                          style: const TextStyle(color: Colors.black),
                        ),
                        Text(
                          controller.streetNosheryProfileFireBaseModel.body?.review?.subTitle ?? "Share App Reviews",
                          style: TextStyle(color: Colors.grey.shade600),
                        )
                      ],
                    ),
                    Text(">",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 20))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(controller.streetNosheryProfileFireBaseModel.body?.pastOrder?.toUpperCase() ?? "PAST ORDERS",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(controller.streetNosheryProfileFireBaseModel.body?.emptyOrderTitle ?? "Order to removing your cravings"),
                )),
            Visibility(
              child: Container(
                color: Colors.grey.shade100,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    controller.streetNosheryProfileFireBaseModel.primaryButtonTitle ?? "Cart >",
                    style: const TextStyle(fontSize: 16), // Text style
                  ),
                ),
              ),
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
  List<MenuItem> foodList;
  int index;
  StreetNosheryPastOrders(
      {super.key, required this.foodList, required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                foodList[index].dishName ?? "",
                style: TextStyle(color: Colors.grey.shade900, fontSize: 15),
              ),
              const SizedBox(
                width: 10,
              ),
              Text("${foodList[index].rating}",
                  style: TextStyle(color: Colors.grey.shade900, fontSize: 15)),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.star, // Star icon
                color: colors.yellowStar, // Icon color
                size: 18, // Icon size
              ),
              const Spacer(),
              Obx(() {
                return Visibility(
                  visible: false,
                  child: IconButton(
                    icon: Icon(
                      (controller.isFavorite.value && controller.tappedFoodId.value == foodList[index].dishId?.toInt())
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: (controller.isFavorite.value && controller.tappedFoodId.value == foodList[index].dishId?.toInt())
                          ? colors.darkLeafGreen
                          : Colors.grey,
                      size: 18,
                    ),
                    onPressed: () {
                      if(controller.tappedFoodId.value == foodList[index].dishId?.toInt()) {
                        controller.isFavorite.value = !controller.isFavorite.value;
                      }
                      else if(controller.tappedFoodId.value != foodList[index].dishId?.toInt()) {
                        controller.isFavorite.value = true;
                      }
                      controller.tappedFoodId.value = foodList[index].dishId?.toInt() ?? 0;
                      controller.updateFavoriteFood();
                    },
                  ),
                );
              })
            ],
          ),
          Text(
            DateFormatter().orderDateFormat(foodList[index].dishOrderDate),
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {
                    controller.updateCart(
                        foodList[index].dishName ?? "",
                        foodList[index].price,
                        foodList[index].dishId as num);
                    controller.updateCartAmount(
                        int.tryParse(foodList[index].price ?? "0") ?? 0, UpdatePrice.add);
                    Get.toNamed(Routes.cart);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white),
                    child: Text(
                      controller.streetNosheryHomePageFirebaseModel.recentBrought?.reorder.toUpperCase() ?? "REORDER",
                      style: const TextStyle(color: Colors.black, fontSize: 15),
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ReviewPopup();
                      },
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orangeAccent),
                        color: Colors.white),
                    child: Text(
                      controller.streetNosheryHomePageFirebaseModel.recentBrought?.rate.toUpperCase() ?? "RATE ORDER",
                      style:
                          const TextStyle(color: Colors.orangeAccent, fontSize: 15),
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
