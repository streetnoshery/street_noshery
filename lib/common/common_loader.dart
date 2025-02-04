import 'package:flutter/material.dart';
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
void showLoader(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      opaque: false, // Ensures transparency effect
      pageBuilder: (context, _, __) => const FullPageLoader(),
    ),
  );
}

void hideLoader(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context); // Close the loader if it's open
  }
}
