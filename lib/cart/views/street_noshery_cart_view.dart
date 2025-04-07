import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/cart/controllers/street_noshery_cart_controller.dart';
import 'package:street_noshery/cart/widgets/street_noshery_cart_details_widget.dart';
import 'package:street_noshery/cart/widgets/street_noshery_cart_saving_corner_widget.dart';
import 'package:street_noshery/cart/widgets/street_noshery_payment_list_widget.dart';
import 'package:street_noshery/cart/widgets/street_noshery_service_type_widget.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';

class StreetNosheryCartView extends GetView<StreetNosheryCartController> {
  const StreetNosheryCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: Obx(() {
        return SizedBox(
          width: Get.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Background color
                foregroundColor: Colors.white, // Text color
              ),
              onPressed: controller.homeController.foodCartList.isNotEmpty
                  ? () async {
                      print('Save button pressed');
                      showLoader();
                      await controller.placeOrder();
                      hideLoader();
                    }
                  : null,
              child: Text(controller.streetNosheryFirebasemodel.primaryCTA ?? 'Pay'),
            ),
          ),
        );
      }),
      body: Obx(() {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * .16,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: colors.lightLeafGreen,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight:
                            Radius.circular(30)), // Optional: Rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () {
                            controller.homeController.selectedTab.value =
                                TabEnum.home;
                            Get.back();
                          },
                        ),
                      ),
                      Center(
                        child: Text(
                          controller.streetNosheryFirebasemodel.title ?? "Cart",
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const StreetNosheryCartDetailsWidget(),
                const SizedBox(
                  height: 20,
                ),
                const StreetNosherySavingCorner(),
                const SizedBox(
                  height: 20,
                ),
                const StreetNosheryServiceTypeWidget(),
                const SizedBox(
                  height: 20,
                ),
                const StreetNosheryPaymentWidget(),
                Center(
                  child: Visibility(
                      visible:
                          !controller.homeController.foodCartList.isNotEmpty,
                      child: Column(
                        children: [
                          SizedBox(
                            width: Get.width * .6,
                            child: Image.asset(
                              controller.allImages.streetNosheryLogo,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.streetNosheryFirebasemodel.emptyCartTitle ?? "Please choose a food item to enjoy!",
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: controller.homeController.foodCartList.isNotEmpty
                      ? 80
                      : 60,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

extension DateTimeExtension on DateTime {
  String toShortString() {
    return "$day/$month/$year";
  }
}
