import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_home_page_appbar_widget.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_home_page_customer_fav_food_items.dart';
import 'package:street_noshery/orders/views/street_noshery_order_view.dart';
import 'package:street_noshery/profile/views/street_noshery_profile_view.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryHomePage extends GetView<StreetNosheryHomeController> {
  const StreetNosheryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = CommonTheme();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: colorsTheme.theme.pageBackgroundColor,
        appBar: const StreetNosheryHomepageAppbar(),
        body: Container(
          decoration: BoxDecoration(
            color: colorsTheme.theme.greyTer,
            boxShadow: [
              BoxShadow(
                color: colorsTheme.theme.textPrimary.withOpacity(0.3), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 8, // Blur radius
                offset: const Offset(0, 4), // Offset in X and Y direction
              ),
            ],
          ),
          child: Obx(() {
            controller.homeState.value;
            controller.bestSeller;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(controller.allImages.homePageBackgroundimage,
                      height: Get.height * .30,
                      width: Get.width,
                      fit: BoxFit.fill),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1.5,
                    color: colorsTheme.theme.greySecondary,
                  ),
                  Visibility(
                    visible:
                        controller.streetNosheryUser.value.isRegisterForShop ??
                            false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Orders",
                            style: TextStyle(
                                color: colorsTheme.theme.textPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const StreetNosheryOrderView()
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !(controller
                            .streetNosheryUser.value.isRegisterForShop ??
                        true),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller.selectedTab.value = TabEnum.home;
                                  },
                                  child: Text(
                                    controller
                                            .streetNosheryHomePageFirebaseModel
                                            .menuTab
                                            ?.home ??
                                        "Home",
                                    style: TextStyle(
                                      color: colorsTheme.theme.textPrimary,
                                      fontSize: 15
                                    ),
                                  )),
                              (controller.selectedTab.value == TabEnum.home)
                                  ? Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: colorsTheme.theme.lightMossgreen,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller.selectedTab.value = TabEnum.menu;
                                    Get.toNamed(Routes.menu);
                                  },
                                  child: Text(
                                    controller
                                            .streetNosheryHomePageFirebaseModel
                                            .menuTab
                                            ?.menu ??
                                        "Menu",
                                    style: TextStyle(
                                      color: colorsTheme.theme.textPrimary,
                                      fontSize: 15
                                    ),
                                  )),
                              (controller.selectedTab.value == TabEnum.menu)
                                  ? Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: colorsTheme.theme.lightMossgreen,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller.selectedTab.value = TabEnum.cart;
                                    Get.toNamed(Routes.cart);
                                  },
                                  child: Text(
                                    controller
                                            .streetNosheryHomePageFirebaseModel
                                            .menuTab
                                            ?.cart ??
                                        "Cart",
                                    style: TextStyle(
                                      color: colorsTheme.theme.textPrimary,
                                      fontSize: 15
                                    ),
                                  )),
                              (controller.selectedTab.value == TabEnum.cart)
                                  ? Container(
                                      width: 50,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: colorsTheme.theme.lightMossgreen,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !(controller
                            .streetNosheryUser.value.isRegisterForShop ??
                        true),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Divider(
                        thickness: 1.5,
                        color: colorsTheme.theme.greySecondary,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !(controller
                            .streetNosheryUser.value.isRegisterForShop ??
                        true),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15),
                      child: Text(
                        controller.streetNosheryHomePageFirebaseModel
                                .homePageBestSeller?.title ??
                            "BestSeller",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: colorsTheme.theme.orangeAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !(controller
                            .streetNosheryUser.value.isRegisterForShop ??
                        true),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 250,
                        child: ScrollSnapList(
                          itemBuilder: (context, index) {
                            return BestSellerFoodItems(index: index);
                          },
                          itemCount: controller.bestSeller.length,
                          itemSize: 150,
                          onItemFocus: (index) {},
                          dynamicItemSize: true,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (controller.recentlyBroughtFoodItems.isNotEmpty &&
                        !(controller
                                .streetNosheryUser.value.isRegisterForShop ??
                            true)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Text(
                        controller.streetNosheryHomePageFirebaseModel
                                .recentBrought?.title ??
                            "Recent brought",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: (controller.recentlyBroughtFoodItems.isNotEmpty &&
                        !(controller
                                .streetNosheryUser.value.isRegisterForShop ??
                            true)),
                    child: Container(
                      color: Colors.grey.shade100,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final foodList =
                                controller.recentlyBroughtFoodItems;
                            return StreetNosheryPastOrders(
                                foodList: foodList, index: index);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              thickness: 0.5,
                            );
                          },
                          itemCount:
                              controller.recentlyBroughtFoodItems.length),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
