import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/vertical_time_line_stapper.dart';
import 'package:street_noshery/order_tracking/controller/street_noshery_order_tracking_controller.dart';

class StreetNosheryOrdertrackingView
    extends GetView<StreetNosheryOrderTrackingController> {
  const StreetNosheryOrdertrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 60),
            child: Image.asset(controller.allImages.streetNosheryLogo,
                height: 80, width: 80, fit: BoxFit.fill),
          ),
          const StreetNosheryTimeLineTile()
        ],
      ),
    );
  }
}
