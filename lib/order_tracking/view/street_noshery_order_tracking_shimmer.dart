import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StreetNosheryOrderTrackingShimmer extends StatelessWidget{
  const StreetNosheryOrderTrackingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
          ),
        );
  }

}