import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';

class StreetNosheryHelp extends GetView<StreetNosheryHomeController> {
  const StreetNosheryHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = CommonTheme();
    return Scaffold(
      backgroundColor: colorsTheme.theme.pageBackgroundColor,
      appBar: AppBar(
        title: Text(controller.streetnosheryHelpAndSupportFirebaseModel.title ?? 'Help & Support', style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),),
        backgroundColor: colorsTheme.theme.lightLeafGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.streetnosheryHelpAndSupportFirebaseModel.body?.title ?? 'How can we help you?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: colorsTheme.theme.textPrimary),
            ),
            const SizedBox(height: 10),
            Text(
              controller.streetnosheryHelpAndSupportFirebaseModel.body?.subTitle ?? 'If you have any issues with your order, please contact us using the details below.',
              style: TextStyle(fontSize: 15, color: colorsTheme.theme.textSecondary),
            ),
            ListTile(
              leading: Icon(Icons.email, color: colorsTheme.theme.darkLeafGreen, size: 25,),
              title: Text('support@yourapp.com', style: TextStyle(color: colorsTheme.theme.textSecondary, fontSize: 15),),
              onTap: () {
                controller.sendEmail('sumitgod510@gmail.com');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
