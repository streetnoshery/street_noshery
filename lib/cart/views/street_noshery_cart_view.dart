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
    final colorsTheme = CommonTheme();
    return Scaffold(
      backgroundColor: colorsTheme.theme.pageBackgroundColor,
      appBar: AppBar(
        title: Text(
          controller.streetNosheryFirebasemodel.title ?? "Cart",
          style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),
        ),
        backgroundColor: colorsTheme.theme.lightLeafGreen,
        leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: colorsTheme.theme.textPrimary),
              onPressed: () {
                controller.homeController.selectedTab.value = TabEnum.home;
                Get.back();
              },
            ),
      ),
      floatingActionButton: Obx(() {
        return SizedBox(
          width: Get.width,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorsTheme.theme.textPrimary, // Background color
                foregroundColor: colorsTheme.theme.surface, // Text color
              ),
              onPressed: controller.homeController.foodCartList.isNotEmpty
                  ? () async {
                      showLoader();
                      await controller.createFT();
                      hideLoader();
                      controller.placeOrder();
                    }
                  : null,
              child: Text(
                  controller.streetNosheryFirebasemodel.primaryCTA ?? 'Pay', style: TextStyle(color: controller.homeController.foodCartList.isNotEmpty ? colorsTheme.theme.surface : colorsTheme.theme.greySecondary),),
            ),
          ),
        );
      }),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          controller.streetNosheryFirebasemodel
                                  .emptyCartTitle ??
                              "Please choose a food item to enjoy!",
                          style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),
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
