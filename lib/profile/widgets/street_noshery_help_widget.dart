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
        title: Text('Help & Support', style: TextStyle(color: colors.textPrimary, fontSize: 18),),
        backgroundColor: colors.lightLeafGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How can we help you?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.textPrimary),
            ),
            const SizedBox(height: 10),
            Text(
              'If you have any issues with your order, please contact us using the details below.',
              style: TextStyle(fontSize: 15, color: colors.greySecondary),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone, color: colors.darkLeafGreen),
              title: const Text('Call Us: +91 98765 43210'),
              onTap: () {
                // Implement call functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.email, color: colors.darkLeafGreen),
              title: const Text('support@yourapp.com'),
              onTap: () {
                // Implement email functionality
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.textPrimary),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: Text('How do I track my order?', style: TextStyle(color: colors.textPrimary),),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('You can track your order in the "Orders" section of the app.', style: TextStyle(color: colors.textSecondary),),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('What if my food is late?', style: TextStyle(color: colors.textPrimary)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('You can contact our support team to get real-time updates.', style: TextStyle(color: colors.textSecondary)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
