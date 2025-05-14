import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';
import 'package:street_noshery/cart/widgets/street_noshery_dotted_underline_widget.dart';
import 'package:street_noshery/cart/widgets/street_noshery_flexible_dotted_divider_widget.dart';
import 'package:street_noshery/common/common_theme.dart';

class StreetNosheryPaymentWidget extends GetView<StreetNosheryCartController> {
  const StreetNosheryPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = CommonTheme();
    return Obx(() {
      return Visibility(
          visible: controller.homeController.foodCartList.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration:  BoxDecoration(
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
                      "${controller.streetNosheryFirebasemodel.bill?.title ?? "To Pay"} \u20B9${controller.homeController.totalPayment.value}",
                      style: TextStyle(
                          color: colorTheme.theme.textPrimary, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      controller.streetNosheryFirebasemodel.bill?.subTitle ?? "Incl. all taxes & charges",
                      style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.streetNosheryFirebasemodel.bill?.totalitem ?? "Item total",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15)),
                        Text(
                            "\u20B9${controller.homeController.totalCartAmount.value}",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.streetNosheryFirebasemodel.bill?.deliveryFee ?? "Delivery Fee",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15)),
                        Text("\u20B9${controller.homeController.deliveryFee.value}",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15))
                      ],
                    ),
                    Stack(
                      children: [
                        Text(
                          "Order above \u20B9 ${500} to save \u20B9 ${120}",
                          style: TextStyle(color: colorTheme.theme.greySecondary, fontSize: 15),
                        ),
                        Positioned.fill(
                          child: CustomPaint(
                            painter: DottedUnderlinePainter(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.streetNosheryFirebasemodel.bill?.platformFee ?? "Platform fee",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15)),
                        Text("\u20B9${controller.homeController.platFormFee.value}",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.streetNosheryFirebasemodel.bill?.restaurantCharges ??  "GST and Restaurant Charges",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15)),
                        Text("\u20B9${controller.homeController.gst.value}",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const FlexibleDottedDivider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.streetNosheryFirebasemodel.bill?.pay ?? "Pay",
                          style: TextStyle(color: colorTheme.theme.textPrimary, fontSize: 15),
                        ),
                        Text("\u20B9${controller.homeController.totalPayment.value}",
                            style: TextStyle(color: colorTheme.theme.textSecondary, fontSize: 15))
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
