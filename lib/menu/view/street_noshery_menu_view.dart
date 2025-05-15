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
    final colorsTheme = CommonTheme();
    return Obx(() {
      controller.menuList;
      return Scaffold(
          backgroundColor: colorsTheme.theme.pageBackgroundColor,
          appBar: AppBar(
            title: Text(
              "Menu",
              style:
                  TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),
            ),
            backgroundColor: colorsTheme.theme.lightLeafGreen,
            leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: colorsTheme.theme.textPrimary),
              onPressed: () {
                controller.homeController.selectedTab.value = TabEnum.home;
                Get.back();
              },
            ),
          ),
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
                  controller.streetNosheryMenuFirebaseStaticModel
                          .primaryCtaTitle ??
                      "Cart >",
                  style: TextStyle(
                      fontSize: 15,
                      color: controller.homeController.foodCartList.isNotEmpty
                          ? colorsTheme.theme.surface
                          : colorsTheme.theme.greySecondary), // Text style
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  colorsTheme.theme.shadowColor, // Shadow color
                              blurRadius: 6, // Blur radius
                              spreadRadius: 2, // Spread radius
                              offset:
                                  const Offset(2, 4), // Shadow offset (x, y)
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Discover Delight at Street Noshery",
                                  style: TextStyle(
                                      color: colorsTheme.theme.textPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Flavors that feel like home.",
                                  style: TextStyle(
                                      color: colorsTheme.theme.textSecondary,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                        color: colorsTheme.theme.lightMossgreen,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
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
                                          color: colorsTheme
                                              .theme.yellowStar, // Icon color
                                          size: 15, // Icon size
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${controller.rating.value}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: colorsTheme.theme.surface),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controller
                                          .streetNosheryMenuFirebaseStaticModel
                                          .appbar
                                          ?.rating ??
                                      "Ratings",
                                  style: TextStyle(
                                      color: colorsTheme.theme.textSecondary,
                                      fontSize: 13),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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
                            controller.streetNosheryMenuFirebaseStaticModel
                                    .recentBroughtTitle ??
                                "Recently Brought",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: colorsTheme.theme.textPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "😋", // Yummy face emoji
                            style: TextStyle(
                                fontSize: 20,
                                color: colorsTheme.theme.yellowStar),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                                  controller
                                          .streetNosheryMenuFirebaseStaticModel
                                          .menu
                                          ?.breakfastTitle ??
                                      "Healthy Breakfast & Gym Diet",
                                  style: TextStyle(
                                      color: colorsTheme.theme.textPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                (controller.isBreakfastSelected.value)
                                    ? Icon(
                                        Icons.expand_less,
                                        size: 30,
                                        color: colorsTheme.theme.textPrimary,
                                      )
                                    : Icon(
                                        Icons.expand_more,
                                        size: 30,
                                        color: colorsTheme.theme.textPrimary,
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
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
                                  controller
                                          .streetNosheryMenuFirebaseStaticModel
                                          .menu
                                          ?.thaliAndCombosTitle ??
                                      "Thalis & Combos for ${"Sumit"}",
                                  style: TextStyle(
                                      color: colorsTheme.theme.textPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                (controller.isFooditemSelected.value)
                                    ? Icon(
                                        Icons.expand_less,
                                        size: 30,
                                        color: colorsTheme.theme.textPrimary,
                                      )
                                    : Icon(
                                        Icons.expand_more,
                                        size: 30,
                                        color: colorsTheme.theme.textPrimary,
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
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
                                  controller
                                          .streetNosheryMenuFirebaseStaticModel
                                          .menu
                                          ?.sidesAndDrinksTitle ??
                                      "Sides & Drinks",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                (controller.isDrinksSelected.value)
                                    ? Icon(
                                        Icons.expand_less,
                                        size: 30,
                                        color: colorsTheme.theme.textPrimary,
                                      )
                                    : Icon(
                                        Icons.expand_more,
                                        size: 30,
                                        color: colorsTheme.theme.textPrimary,
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10,),
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
  final colorsTheme = CommonTheme();
  return SizedBox(
    width: 150,
    height: 300,
    child: InkWell(
      splashColor: colorsTheme.theme.transwparent, // Removes the splash color
      highlightColor: colorsTheme.theme.transwparent,
      onTap: () {
        streetNosheryMenuController.homeController
            .addAllItemsToCart(favFoodData[index].orderItems ?? []);
        for (var foodItem in favFoodData[index].orderItems ?? []) {
          streetNosheryMenuController.updateItems(foodItem.foodId);
        }
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
                  streetNosheryMenuController.homeController
                      .getPastOrderDetails(favFoodData[index].orderItems ?? [])
                      .title,
                  style: TextStyle(
                      color: colorsTheme.theme.textSecondary, fontSize: 15),
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
                      streetNosheryMenuController.homeController
                              .getPastOrderDetails(
                                  favFoodData[index].orderItems ?? [])
                              .price ??
                          "",
                      style: TextStyle(
                          color: colorsTheme.theme.textSecondary, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${streetNosheryMenuController.homeController.getPastOrderDetails(favFoodData[index].orderItems ?? []).rating}",
                          style: TextStyle(
                              fontSize: 15,
                              color: colorsTheme.theme.textSecondary),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star, // Star icon
                          color: colorsTheme.theme.yellowStar, // Icon color
                          size: 20, // Icon size
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
