import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';

class StreetNosherySavingCorner extends GetView<StreetNosheryCartController> {
  const StreetNosherySavingCorner({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
          visible: controller.homeController.foodCartList.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, // Shadow color
                      blurRadius: 6, // Blur radius
                      spreadRadius: 2, // Spread radius
                      offset: Offset(2, 4), // Shadow offset (x, y)
                    ),
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Savings Corner",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_offer, // Tag-like icon
                          color: Colors.teal.shade500,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Savings Corner",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
