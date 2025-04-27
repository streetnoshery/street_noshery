import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';

class FullPageLoader extends StatelessWidget {
  const FullPageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFoodLoader();
  }
}

class CustomFoodLoader extends StatefulWidget {
  const CustomFoodLoader({super.key});

  @override
  _CustomFoodLoaderState createState() => _CustomFoodLoaderState();
}

class _CustomFoodLoaderState extends State<CustomFoodLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();

    // Bounce Animation Setup
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.withOpacity(0.3), // Semi-transparent background
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _bounceAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -_bounceAnimation.value),
                  child: Image.asset(
                    CommonImages().streetNosheryLogo,
                    width: 80,
                    height: 80,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Show Loader Function (without GlobalKey issues)
void showLoader() {
  if (Get.isDialogOpen == false) {
    Get.dialog(
      const FullPageLoader(),
      barrierDismissible: false, // Prevent accidental dismiss
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

// ✅ Hide Loader Function (safe pop)
void hideLoader() {
  if (Get.isDialogOpen == true) {
    Get.back();
  }
}
