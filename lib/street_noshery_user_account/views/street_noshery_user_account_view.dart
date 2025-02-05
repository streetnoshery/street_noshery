import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_theme.dart';

import '../controllers/street_noshery_user_account_controller.dart';

class StreetNosheryUserAccountView
    extends GetView<StreetnosheryUserAccountController> {
  const StreetNosheryUserAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Custom AppBar height
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: colors.lightLeafGreen, // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 1, // Blur radius
              offset: const Offset(0, 4), // Offset in X and Y direction
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                // Back button at the left
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Get.back();
                  },
                ),
                // Help button at the right
                Text(
                  controller.accountSettingFirebaseModel.title ?? "SETTINGS",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              controller.accountSettingFirebaseModel.orderRelatedMessages?.title?.toUpperCase() ?? "ORDER RELATED MESSAGES",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  controller.accountSettingFirebaseModel.orderRelatedMessages?.subTitle ?? "Order related SMS cannot be disabled as they are critical to provide service",
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              controller.accountSettingFirebaseModel.recommendations?.title ?? "RECOMMENDATIONS & REMINDERS",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  controller.accountSettingFirebaseModel.recommendations?.subTitle ?? "Keep this on to receive offer recommendations & timely reminders based on your interests",
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.accountSettingFirebaseModel.whatsApp ?? "WhatsApp",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(() {
                          return Switch(
                            value: controller.isWhatsAppToggled.value,
                            onChanged: (value) {
                              controller.isWhatsAppToggled.value = value;
                            },
                            activeColor: colors.lightMossgreen,
                          );
                        })
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          controller.accountSettingFirebaseModel.sms?.toUpperCase() ?? "SMS",
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(() {
                          return Switch(
                            value: controller.isSMSToggled.value,
                            onChanged: (value) {
                              controller.isSMSToggled.value = value;
                            },
                            activeColor: colors.lightMossgreen,
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              controller.accountSettingFirebaseModel.accountDelete?.title ?? "ACCOUNT DELETION",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            width: Get.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(controller.accountSettingFirebaseModel.accountDelete?.subTitle ?? "Delete account", style: TextStyle(color: colors.lightMossgreen, fontWeight: FontWeight.bold),),
            ),
          )
        ],
      )),
    );
  }
}
