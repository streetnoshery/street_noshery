import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';

class StreetNosheryHelp extends GetView<StreetNosheryHomeController> {
  const StreetNosheryHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CommonTheme();
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.streetnosheryHelpAndSupportFirebaseModel.title ?? 'Help & Support', style: TextStyle(color: colors.textPrimary, fontSize: 18),),
        backgroundColor: colors.lightLeafGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.streetnosheryHelpAndSupportFirebaseModel.body?.title ?? 'How can we help you?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.textPrimary),
            ),
            const SizedBox(height: 10),
            Text(
              controller.streetnosheryHelpAndSupportFirebaseModel.body?.subTitle ?? 'If you have any issues with your order, please contact us using the details below.',
              style: TextStyle(fontSize: 15, color: colors.greySecondary),
            ),
            const SizedBox(height: 20),
            // ListTile(
            //   leading: Icon(Icons.phone, color: colors.darkLeafGreen),
            //   title: Text('${controller.streetnosheryHelpAndSupportFirebaseModel.body?.callUs ?? "Call Us:" }+91 98765 43210'),
            //   onTap: () {
            //     // Implement call functionality
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.email, color: colors.darkLeafGreen),
              title: const Text('support@yourapp.com'),
              onTap: () {
                controller.sendEmail('sumitgod510@gmail.com');  //TODO: should add shop email ID
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
