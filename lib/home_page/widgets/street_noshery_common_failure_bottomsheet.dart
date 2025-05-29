import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_theme.dart';

class StreetNosheryCommonErrorBottomsheet extends StatelessWidget {
  final String errorTitle;
  final String? errorSubtitle;
  const StreetNosheryCommonErrorBottomsheet(
      {super.key, required this.errorTitle, this.errorSubtitle});

  @override
  Widget build(BuildContext context) {
    final colorTheme = CommonTheme();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Adjusts to content size
      children: [
        Container(
          padding: const EdgeInsets.all(20), // Adjust size of circle
          decoration: BoxDecoration(
            color: colorTheme.theme.errorText, // Red background color
            shape: BoxShape.circle, // Make it round
          ),
          child: Text(
            '!', // Exclamation mark as text
            style: TextStyle(
              color: colorTheme.theme.surface, // White color for the text
              fontSize: 30, // Adjust the size of the text
              fontWeight: FontWeight.bold, // Make the exclamation bold
            ),
          ),
        ),
        Text(
          errorTitle,
          style: TextStyle(color: colorTheme.theme.textPrimary, fontSize: 20, fontWeight: FontWeight.bold,),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: errorSubtitle?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              errorSubtitle ?? "",
              style: TextStyle(color: colorTheme.theme.textPrimary, fontSize: 15),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: Get.width,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(colorTheme.theme.textPrimary)),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Close',
              style: TextStyle(color: colorTheme.theme.surface, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
