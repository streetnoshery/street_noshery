import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_theme.dart';

import '../controllers/street_noshery_user_account_controller.dart';

class StreetNosheryUserAccountView
    extends GetView<StreetnosheryUserAccountController> {
  const StreetNosheryUserAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = CommonTheme();
    return Scaffold(
      backgroundColor: colorsTheme.theme.pageBackgroundColor,
      appBar: AppBar(
        title: Text(controller.accountSettingFirebaseModel.title ?? "Settings", style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),),
        backgroundColor: colorsTheme.theme.lightLeafGreen,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            color: colorsTheme.theme.lightBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text(
                controller.accountSettingFirebaseModel.orderRelatedMessages?.title
                        ?.toUpperCase() ??
                    "ORDER RELATED MESSAGES",
                style: TextStyle(color: colorsTheme.theme.textSecondary, fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              controller.accountSettingFirebaseModel.orderRelatedMessages
                      ?.subTitle ??
                  "Order related SMS cannot be disabled as they are critical to provide service",
              style: TextStyle(color: colorsTheme.theme.greySecondary, fontSize: 15),
            ),
          ),
          Container(
            width: Get.width,
            color: colorsTheme.theme.lightBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text(
                controller.accountSettingFirebaseModel.recommendations?.title ??
                    "RECOMMENDATIONS & REMINDERS",
                style: TextStyle(color: colorsTheme.theme.textSecondary, fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              controller.accountSettingFirebaseModel.recommendations
                      ?.subTitle ??
                  "Keep this on to receive offer recommendations & timely reminders based on your interests",
              style: TextStyle(color: colorsTheme.theme.greySecondary, fontSize: 15),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.accountSettingFirebaseModel.sms
                              ?.toUpperCase() ??
                          "SMS",
                      style: TextStyle(
                          color: colorsTheme.theme.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Obx(() {
                      return Switch(
                        value: controller
                                .homeController
                                .onboardingController
                                .streetNosheryUserData
                                .value
                                .isEmailNotificationEnable ??
                            true,
                        onChanged: (value) async {
                          showLoader();
                          await controller.notification(value);
                          hideLoader();
                        },
                        activeColor: colorsTheme.theme.lightMossgreen,
                      );
                    })
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            color: colorsTheme.theme.lightBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                controller.accountSettingFirebaseModel.accountDelete?.title ??
                    "ACCOUNT DELETION",
                style: TextStyle(color: colorsTheme.theme.textSecondary, fontSize: 15),
              ),
            ),
          ),
          Container(
            width: Get.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                controller
                        .accountSettingFirebaseModel.accountDelete?.subTitle ??
                    "Delete account",
                style: TextStyle(
                    color: colorsTheme.theme.lightMossgreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Container(color: colorsTheme.theme.lightBackground,
          height: Get.height*0.25,width: Get.width,)
        ],
      )),
    );
  }
}
