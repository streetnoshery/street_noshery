import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_home_page_appbar_widget.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_home_page_customer_fav_food_items.dart';
import 'package:street_noshery/profile/views/street_noshery_profile_view.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryHomePage extends GetView<StreetNosheryHomeController> {
  const StreetNosheryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const StreetNosheryHomepageAppbar(),
      body: Container(
        decoration: BoxDecoration(
          color: colors.greyTer,
          boxShadow: [
            BoxShadow(
              color: colors.textPrimary.withOpacity(0.3), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 8, // Blur radius
              offset: const Offset(0, 4), // Offset in X and Y direction
            ),
          ],
        ),
        child: Obx(() {
          controller.homeState.value;
          // final percentange = controller.sale.value;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                    controller
                        .allImages.homePageBackgroundimage,
                    height: Get.height * .30,
                    width: Get.width,
                    fit: BoxFit.fill),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1.5,
                  color: colors.greySecondary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                controller.selectedTab.value =
                                    TabEnum.home;
                              },
                              child: Text(
                                controller.streetNosheryHomePageFirebaseModel.menuTab?.home ?? "Home",
                                style: TextStyle(
                                  color: colors.textPrimary,
                                ),
                              )),
                          (controller.selectedTab.value ==
                                  TabEnum.home)
                              ? Container(
                                  width: 50,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: colors.lightMossgreen,
                                    borderRadius: const BorderRadius.all(Radius.circular(10))
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                controller.selectedTab.value =
                                    TabEnum.menu;
                                Get.toNamed(Routes.menu);
                              },
                              child: Text(
                                controller.streetNosheryHomePageFirebaseModel.menuTab?.menu ?? "Menu",
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                          (controller.selectedTab.value ==
                                  TabEnum.menu)
                              ? Container(
                                  width: 50,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: colors.lightMossgreen,
                                    borderRadius: const BorderRadius.all(Radius.circular(10))
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                controller.selectedTab.value =
                                    TabEnum.cart;
                                Get.toNamed(Routes.cart);
                              },
                              child: Text(
                                controller.streetNosheryHomePageFirebaseModel.menuTab?.cart ?? "Cart",
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                          (controller.selectedTab.value ==
                                  TabEnum.cart)
                              ? Container(
                                  width: 50,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: colors.lightMossgreen,
                                    borderRadius: const BorderRadius.all(Radius.circular(10))
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: colors.greySecondary,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    controller.streetNosheryHomePageFirebaseModel.homePageBestSeller?.title ?? "BestSeller",
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    controller.streetNosheryHomePageFirebaseModel.recentBrought?.title ?? "Recent brought",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey.shade100,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final foodList = controller.recentlyBroughtFoodItems;
                        return StreetNosheryPastOrders(foodList: foodList, index: index);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 0.5,
                        );
                      },
                      itemCount: 2),
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
    );
  }
}
