import 'package:flutter/material.dart';

class StreetNosheryCommonBottomsheet {
  void showCustomBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  backgroundColor: Colors.white,
  builder: (BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.05,
      expand: false,
      snap: true,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: widget,
              ),
            )
          ]),
        );
      });
  },
);
}}