import 'package:flutter/material.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/main.dart';

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

    // Bounce Animation
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    )..repeat(reverse: true); // Moves up and down

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
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centers content
          children: [
            // Animated Image
            AnimatedBuilder(
              animation: _bounceAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset:
                      Offset(0, -_bounceAnimation.value), // Moves up and down
                  child: Image.asset(
                    CommonImages().streetNosheryLogo, // Your food-themed image
                    width: 80,
                    height: 80,
                  ),
                );
              },
            ),
            const SizedBox(height: 20), // Space between the image and the text
            // // Text under the image
            // const Text(
            //   "Cooking your order...",
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black, // Change color as needed
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Function to show the loader
void showLoader() {
  final context = navigatorKey.currentContext;
  if (context == null || !context.mounted) return;

  navigatorKey.currentState?.push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (_, __, ___) => const FullPageLoader(),
    ),
  );
}

void hideLoader() {
  final context = navigatorKey.currentContext;
  if (context == null || !context.mounted) return;

  if (navigatorKey.currentState?.canPop() ?? false) {
    navigatorKey.currentState?.pop();
  }
}
