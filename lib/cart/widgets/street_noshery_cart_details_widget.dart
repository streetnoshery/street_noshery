import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';

class StreetNosheryCartDetailsWidget
    extends GetView<StreetNosheryCartController> {
  const StreetNosheryCartDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
      visible: controller.homeController.foodCartList.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Shadow color
                  blurRadius: 6, // Blur radius
                  spreadRadius: 2, // Spread radius
                  offset: Offset(2, 4), // Shadow offset (x, y)
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, n) {
                      final cartItem =
                          controller.homeController.foodCartList[n];
                      final itemName =
                          cartItem.dishName ?? ""; // Get the dish name
                      final count =
                          cartItem.count; // Get the quantity
                      final price = num.tryParse(cartItem.price ?? "0");
                      final foodId = cartItem.foodId;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              itemName,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.homeController
                                            .removeFromCart(
                                                itemName);
                                        controller.homeController
                                            .updateCartAmount(price?.toInt() ?? 0,
                                                UpdatePrice.removed);
                                        controller.menuController.removeditems(foodId as num);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          "-",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: Center(
                                        child: Text("$count",
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.homeController.addAllItemsToCart([cartItem]);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("+",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "\u20B9 ${(price?.toInt() ?? 0) * (count?.toInt() ?? 0)}",
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, n) {
                      return Divider(
                        thickness: 1,
                        color: Colors.grey.shade300,
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
