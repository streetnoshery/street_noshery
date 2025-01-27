import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';
import 'package:street_noshery/menu/controller/street_noshery_menu_controller.dart';
import 'package:street_noshery/menu/widgets/street_noshery_menu_food_item_widget.dart';
import 'package:street_noshery/routes/app_pages.dart';

import '../enums/street_noshery_menu_enums.dart';

class StreetNosheryMenuView extends GetView<StreetNosheryMenuController> {
  const StreetNosheryMenuView({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: const Text(
                  "Cart >",
                  style: TextStyle(fontSize: 16), // Text style
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
                      color: Colors.teal.shade100,
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
                                          Text(
                                            "5-10 mins",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          )
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
                                                        Colors.green.shade700,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Icon(
                                                      Icons.star, // Star icon
                                                      color: Colors
                                                          .white, // Icon color
                                                      size: 15, // Icon size
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "4",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                  ],
                                                )),
                                            Text(
                                              "Ratings",
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Recently Brought",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "😋", // Yummy face emoji
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 250,
                    child: ScrollSnapList(
                      itemBuilder: _buildListItems,
                      itemCount: controller.menuList.length,
                      itemSize: 150,
                      onItemFocus: (index) {},
                      dynamicItemSize: true,
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
                              controller.isBreakfastSelected.value =
                                  !controller.isBreakfastSelected.value;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Healthy Breakfast & Gym Diet",
                                  style: TextStyle(
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
                                  itemCount: 2)
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
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
                                const Text(
                                  "Thalis & Combos for ${"Sumit"}",
                                  style: TextStyle(
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
                                  itemCount: controller.food.length)
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
                                const Text(
                                  "Sides & Drinks",
                                  style: TextStyle(
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
                                  itemCount: 2)
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
      onDoubleTap: () {
        streetNosheryMenuController.homeController.removeFromCart(
            favFoodData[index].itemName ?? "", favFoodData[index].price as num);
        streetNosheryMenuController.homeController.updateCartAmount(
            favFoodData[index].price ?? 0, UpdatePrice.removed);
      },
      onTap: () {
        streetNosheryMenuController.homeController.updateCart(
            favFoodData[index].itemName ?? "", favFoodData[index].price as num, favFoodData[index].dishId as num);
        streetNosheryMenuController.homeController
            .updateCartAmount(favFoodData[index].price ?? 0, UpdatePrice.add);
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
                favFoodData[index].image ?? "",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "${favFoodData[index].itemName}",
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
                      "${favFoodData[index].price}",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${favFoodData[index].rating}",
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
