import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/models/favourite_food_model.dart';
import 'package:street_noshery/reviews/widget/street_noshery_common_review_dialogue_box.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';
import 'package:street_noshery/profile/controllers/street_noshery_profile_controller.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryProfileView extends GetView<StreetnosheryProfileController> {
  const StreetNosheryProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150), // Custom AppBar height
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.teal.shade200, // Shadow color
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
                            print("Help pressed");
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
                                      Colors.grey.shade300,
                                      Colors.teal.shade200
                                    ], // Gradient colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )),
                              child: const Text(
                                "Help",
                                style: TextStyle(color: Colors.black),
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
                          : controller.onboardingController.userName.value,
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
                          : controller.onboardingController.contactNumber.value,
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
                      child: const Text(
                        "EDIT PROFILE  >",
                        style: TextStyle(
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
                        const Text(
                          "My Account",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Settings",
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
                        const Text(
                          "Address",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Share, Edit & Add New Address",
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
                        const Text(
                          "Review",
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          "Share App Reviews",
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
              child: Text("PAST ORDERS",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Order to removing your cravings"),
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
                  child: const Text(
                    "Cart >",
                    style: TextStyle(fontSize: 16), // Text style
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
  List<FavouriteFood> foodList;
  int index;
  StreetNosheryPastOrders(
      {super.key, required this.foodList, required this.index});

  @override
  Widget build(BuildContext context) {
    final recentBroughtItems = controller.recentlyBroughtFoodItems;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${recentBroughtItems[index].itemName}",
            style: TextStyle(color: Colors.grey.shade900, fontSize: 15),
          ),
          Text(
            "${recentBroughtItems[index].dateTime}",
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
                        recentBroughtItems[index].itemName ?? "",
                        recentBroughtItems[index].price as num, recentBroughtItems[index].dishId as num);
                    controller.updateCartAmount(
                        recentBroughtItems[index].price ?? 0, UpdatePrice.add);
                    Get.toNamed(Routes.cart);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white),
                    child: const Text(
                      "REORDER",
                      style: TextStyle(color: Colors.black, fontSize: 15),
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
                        return ReviewPopup();
                      },
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orangeAccent),
                        color: Colors.white),
                    child: const Text(
                      "RATE ORDER",
                      style:
                          TextStyle(color: Colors.orangeAccent, fontSize: 15),
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
