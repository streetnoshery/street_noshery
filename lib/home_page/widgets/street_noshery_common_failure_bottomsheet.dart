import 'package:flutter/material.dart';

class StreetNosheryCommonErrorBottomsheet extends StatelessWidget {
  const StreetNosheryCommonErrorBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Adjusts to content size
      children: [
        const Text(
          'Dynamic Bottom Sheet',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'This bottom sheet height adjusts to fit its content.',
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close the bottom sheet
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
