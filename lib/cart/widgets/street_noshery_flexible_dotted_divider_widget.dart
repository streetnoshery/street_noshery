import 'package:flutter/material.dart';

class FlexibleDottedDivider extends StatelessWidget {
  final Color color;
  final double dotSize;
  final double spaceBetweenDots;

  const FlexibleDottedDivider({
    Key? key,
    this.color = Colors.grey,
    this.dotSize = 3.0,
    this.spaceBetweenDots = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final numberOfDots =
            (totalWidth / (dotSize + spaceBetweenDots)).floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            numberOfDots,
            (index) => Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ).toList(),
        );
      },
    );
  }
}