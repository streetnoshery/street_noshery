import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryHomepageAppbar extends GetView<StreetNosheryHomeController>
    implements PreferredSizeWidget {
  @override
  final Size preferredSize; // Override the preferredSize property

  const StreetNosheryHomepageAppbar({Key? key})
      : preferredSize = const Size.fromHeight(80), // Set desired height
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    final name = controller.getFirstName(controller.streetNosheryUser.value.userName ?? controller.onboardingController.userName.value);
    final colorsTheme = CommonTheme();
    return PreferredSize(
      preferredSize: const Size.fromHeight(80), // Set desired height here
      child: AppBar(
        backgroundColor: colorsTheme.theme.lightLeafGreen,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 5, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.streetNosheryHomePageFirebaseModel.appBar?.titlePrefix ?? "Hi,"} $name!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: colorsTheme.theme.textPrimary,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${controller.streetNosheryUser.value.userName ?? controller.onboardingController.userName.value}...",
                style: TextStyle(color: colorsTheme.theme.textSecondary, fontSize: 12),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.profile);
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: colorsTheme.theme.textTer,
                child: const Icon(
                  Icons.person, // Profile placeholder icon
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    });
  }
}
