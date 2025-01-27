import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';

class StreetNosheryHeartbeatScreen extends StatelessWidget {
  const StreetNosheryHeartbeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.isRegistered<StreetNosheryOnboardingController>()
            ? Get.find<StreetNosheryOnboardingController>()
            : Get.put(StreetNosheryOnboardingController());
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1.0, end: 1.5),
          duration: const Duration(seconds: 2),
          curve: Curves.elasticInOut, // Adds a bouncy heartbeat feel
          builder: (context, double scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          child: TweenAnimationBuilder(
            tween:
                ColorTween(begin: Colors.teal.shade800, end: Colors.green.shade800),
            duration: const Duration(seconds: 5),
            builder: (context, Color? color, child) {
              return Text(
                "Street Noshery",
                style: TextStyle(
                  color: color,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sansita', // Change font if needed
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
