import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';
import 'package:street_noshery/menu/controller/street_noshery_menu_controller.dart';
import 'package:street_noshery/menu/widgets/street_noshery_menu_food_item_widget.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryMenuView extends GetView<StreetNosheryMenuController> {
  const StreetNosheryMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Obx(() {
      controller.menuList;
      return Scaffold(
          backgroundColor: Colors.grey.shade100,
          floatingActionButton: SizedBox(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
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
                          : Colors.grey.shade400, // Text color
                  elevation: 5, // Shadow depth
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15), // Padding
                  shape: RoundedRectangleBorder(
                    // Rounded corners
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  controller.streetNosheryMenuFirebaseStaticModel.primaryCtaTitle ?? "Cart >",
                  style: const TextStyle(fontSize: 16), // Text style
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * .25,
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
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.black),
                                onPressed: () {
                                  controller.homeController.selectedTab.value =
                                      TabEnum.home;
                                  Get.back();
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: Get.width,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Office address cafe name",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          // Text(
                                          //   "5-10 ${controller.streetNosheryMenuFirebaseStaticModel.appbar?.deliveryTimeMin ?? "mins"}",
                                          //   style: const TextStyle(
                                          //       color: Colors.black,
                                          //       fontSize: 15),
                                          // )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                    color:
                                                        colors.lightMossgreen,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Icon(
                                                      Icons.star, // Star icon
                                                      color: colors.yellowStar, // Icon color
                                                      size: 15, // Icon size
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "${controller.ratings.averageRating?.toInt()}",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                )),
                                            Text(
                                              controller.streetNosheryMenuFirebaseStaticModel.appbar?.rating ?? "Ratings",
                                              style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 13),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: controller.menuList.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            controller.streetNosheryMenuFirebaseStaticModel.recentBroughtTitle ?? "Recently Brought",
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "😋", // Yummy face emoji
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: controller.menuList.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: SizedBox(
                        height: 250,
                        child: ScrollSnapList(
                          itemBuilder: _buildListItems,
                          itemCount: controller.menuList.length,
                          itemSize: 150,
                          onItemFocus: (index) {},
                          dynamicItemSize: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 30),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.isBreakfastSelected.value =
                                  !controller.isBreakfastSelected.value;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.streetNosheryMenuFirebaseStaticModel.menu?.breakfastTitle ?? "Healthy Breakfast & Gym Diet",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                (controller.isBreakfastSelected.value)
                                    ? const Text(
                                        "^",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 25),
                                      )
                                    : const Text("v",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                              ],
                            ),
                          ),
                          (controller.isBreakfastSelected.value)
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return StreetnosheryMenuItems(
                                      foodItem: controller.tempBreakfast[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    );
                                  },
                                  itemCount: controller.tempBreakfast.length)
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 30),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.isFooditemSelected.value =
                                  !controller.isFooditemSelected.value;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.streetNosheryMenuFirebaseStaticModel.menu?.thaliAndCombosTitle ?? "Thalis & Combos for ${"Sumit"}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                (controller.isFooditemSelected.value)
                                    ? const Text(
                                        "^",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 25),
                                      )
                                    : const Text("v",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                              ],
                            ),
                          ),
                          (controller.isFooditemSelected.value)
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return StreetnosheryMenuItems(
                                      foodItem: controller.tempFoodArray[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    );
                                  },
                                  itemCount: controller.tempFoodArray.length)
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 30),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.isDrinksSelected.value =
                                  !controller.isDrinksSelected.value;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.streetNosheryMenuFirebaseStaticModel.menu?.sidesAndDrinksTitle ?? "Sides & Drinks",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                (controller.isDrinksSelected.value)
                                    ? const Text(
                                        "^",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 25),
                                      )
                                    : const Text("v",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20)),
                              ],
                            ),
                          ),
                          (controller.isDrinksSelected.value)
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return StreetnosheryMenuItems(
                                      foodItem: controller.tempDrinks[index],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    );
                                  },
                                  itemCount: controller.tempDrinks.length)
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}

Widget _buildListItems(BuildContext context, int index) {
  final streetNosheryMenuController =
      Get.isRegistered<StreetNosheryMenuController>()
          ? Get.find<StreetNosheryMenuController>()
          : Get.put(StreetNosheryMenuController());
  final favFoodData = streetNosheryMenuController.menuList;
  return SizedBox(
    width: 150,
    height: 300,
    child: InkWell(
      splashColor: Colors.transparent, // Removes the splash color
      highlightColor: Colors.transparent,
      onTap: () {
        streetNosheryMenuController.homeController.addAllItemsToCart(favFoodData[index].orderItems ?? []);
        Get.toNamed(Routes.cart);
      },
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                streetNosheryMenuController.allImages.streetNosheryLogo,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  streetNosheryMenuController.homeController.getPastOrderDetails(favFoodData[index].orderItems ??[]).title,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      streetNosheryMenuController.homeController.getPastOrderDetails(favFoodData[index].orderItems ??[]).price ?? "",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${streetNosheryMenuController.homeController.getPastOrderDetails(favFoodData[index].orderItems ??[]).rating}",
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.star, // Star icon
                          color: Colors.amber, // Icon color
                          size: 15, // Icon size
                        ),
                        const SizedBox(
                          width: 15,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
