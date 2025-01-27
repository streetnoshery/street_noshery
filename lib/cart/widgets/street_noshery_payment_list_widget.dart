import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';
import 'package:street_noshery/cart/widgets/street_noshery_dotted_underline_widget.dart';
import 'package:street_noshery/cart/widgets/street_noshery_flexible_dotted_divider_widget.dart';

class StreetNosheryPaymentWidget extends GetView<StreetNosheryCartController> {
  const StreetNosheryPaymentWidget({super.key});

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
                    Text(
                      "To Pay \u20B9 ${controller.homeController.totalPayment.value}",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Incl. all taxes & charges",
                      style: TextStyle(color: Colors.grey.shade600),
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
                        Text("Item total",
                            style: TextStyle(color: Colors.grey.shade600)),
                        Text(
                            "\u20B9 ${controller.homeController.totalCartAmount.value}",
                            style: TextStyle(color: Colors.grey.shade900))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Fee",
                            style: TextStyle(color: Colors.grey.shade600)),
                        Text("\u20B9 ${controller.homeController.deliveryFee.value}",
                            style: TextStyle(color: Colors.grey.shade900))
                      ],
                    ),
                    Stack(
                      children: [
                        Text(
                          "Order above \u20B9 ${500} to save \u20B9 ${120}",
                          style: TextStyle(color: Colors.grey.shade600),
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
                        Text("Platform fee",
                            style: TextStyle(color: Colors.grey.shade600)),
                        Text("\u20B9 ${controller.homeController.platFormFee.value}",
                            style: TextStyle(color: Colors.grey.shade900))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GST and Restaurant Charges",
                            style: TextStyle(color: Colors.grey.shade600)),
                        Text("\u20B9 ${controller.homeController.gst.value}",
                            style: TextStyle(color: Colors.grey.shade900))
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
                        const Text(
                          "Pay",
                        ),
                        Text("\u20B9 ${controller.homeController.totalPayment.value}",
                            style: TextStyle(color: Colors.grey.shade900))
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
