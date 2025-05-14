import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';
import 'package:street_noshery/common/common_theme.dart';

class StreetNosherySavingCorner extends GetView<StreetNosheryCartController> {
  const StreetNosherySavingCorner({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = CommonTheme();
    return Obx(() {
      return Visibility(
          visible: controller.homeController.foodCartList.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: colorTheme.theme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: colorTheme.theme.shadowColor, // Shadow color
                      blurRadius: 6, // Blur radius
                      spreadRadius: 2, // Spread radius
                      offset: const Offset(2, 4), // Shadow offset (x, y)
                    ),
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.streetNosheryFirebasemodel.savingCorner?.title ??  "Savings Corner",
                      style: TextStyle(fontSize: 15, color: colorTheme.theme.textPrimary),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_offer, // Tag-like icon
                          color: colorTheme.theme.veg,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          controller.streetNosheryFirebasemodel.savingCorner?.subtitle ?? "Savings Corner",
                          style: TextStyle(
                              fontSize: 15, color: colorTheme.theme.greySecondary),
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
