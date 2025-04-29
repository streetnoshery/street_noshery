import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StreetNosheryCommonErrorBottomsheet extends StatelessWidget {
  final String errorTitle;
  final String? errorSubtitle;
  const StreetNosheryCommonErrorBottomsheet(
      {super.key, required this.errorTitle, this.errorSubtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Adjusts to content size
      children: [
        Container(
          padding: const EdgeInsets.all(15), // Adjust size of circle
          decoration: BoxDecoration(
            color: Colors.red.shade800, // Red background color
            shape: BoxShape.circle, // Make it round
          ),
          child: const Text(
            '!', // Exclamation mark as text
            style: TextStyle(
              color: Colors.white, // White color for the text
              fontSize: 30, // Adjust the size of the text
              fontWeight: FontWeight.bold, // Make the exclamation bold
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          errorTitle,
          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: errorSubtitle?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              errorSubtitle ?? "",
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: Get.width,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black)),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
