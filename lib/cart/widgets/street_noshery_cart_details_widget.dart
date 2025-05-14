import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';

class StreetNosheryCartDetailsWidget
    extends GetView<StreetNosheryCartController> {
  const StreetNosheryCartDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = CommonTheme();
    return Obx(() {
      return Visibility(
        visible: controller.homeController.foodCartList.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Container(
            decoration: BoxDecoration(
                color: colorTheme.theme.surface,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: colorTheme.theme.shadowColor, // Shadow color
                    blurRadius: 6, // Blur radius
                    spreadRadius: 2, // Spread radius
                    offset: const Offset(2, 4), // Shadow offset (x, y)
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, n) {
                        final cartItem =
                            controller.homeController.foodCartList[n];
                        final itemName =
                            cartItem.dishName ?? ""; // Get the dish name
                        final count = cartItem.count; // Get the quantity
                        final price = num.tryParse(cartItem.price ?? "0");
                        final foodId = cartItem.foodId;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                itemName,
                                style:  TextStyle(
                                    color: colorTheme.theme.textPrimary, fontSize: 15),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: colorTheme.theme.textPrimary,
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(5))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.homeController
                                              .removeFromCart(itemName);
                                          controller.homeController
                                              .updateCartAmount(
                                                  price?.toInt() ?? 0,
                                                  UpdatePrice.removed);
                                          controller.menuController
                                              .removeditems(foodId as num);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "-",
                                            style:
                                                TextStyle(color: colorTheme.theme.surface, fontSize: 15),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                        child: Center(
                                          child: Text("$count",
                                              style: TextStyle(
                                                  color: colorTheme.theme.surface, fontSize: 15)),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.homeController
                                              .addAllItemsToCart([cartItem]);
                                          controller.menuController
                                              .updateItems(foodId);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text("+",
                                              style: TextStyle(
                                                  color: colorTheme.theme.surface, fontSize: 15)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "\u20B9 ${(price?.toInt() ?? 0) * (count?.toInt() ?? 0)}",
                                  style: TextStyle(color: colorTheme.theme.textPrimary, fontSize: 15),
                                )
                              ],
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, n) {
                        return Divider(
                          thickness: 2,
                          color: colorTheme.theme.greyTer,
                        );
                      },
                      itemCount: controller.homeController.foodCartList.length),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
