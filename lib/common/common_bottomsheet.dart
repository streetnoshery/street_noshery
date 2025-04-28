import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Make sure you import GetX

class StreetNosheryCommonBottomSheet extends StatelessWidget {
  final Widget child;

  const StreetNosheryCommonBottomSheet({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenHeight * 0.8, // Maximum 80% height
            ),
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> show({required Widget child}) async {
    await Get.bottomSheet(
      SafeArea(
        // <-- Wrap manually with SafeArea
        child: StreetNosheryCommonBottomSheet(child: child),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
    );
  }
}
