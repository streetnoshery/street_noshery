import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class StreetNosheryMenuMoreDetails extends StatelessWidget {
  const StreetNosheryMenuMoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Adjusts to content size
        children: [
          Text("test more details")
        ],
      ),
    );
  }

}