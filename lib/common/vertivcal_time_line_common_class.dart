import 'package:flutter/widgets.dart';

class StreetNosheryTimeLineModel {
  final List<TimeLine> timeLine;
  final num? padding;
  final num? height;

  const StreetNosheryTimeLineModel({
    this.padding,
    required this.timeLine,
    this.height
  });
}

class TimeLine {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final num? padding;
  final String title;
  final String? subTitle;
  final Color indicatorColor;
  final IconData indicatorIcon;
  final Color iconColor;
  final Color lineColor;
  const TimeLine(
      {required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.title,
      required this.indicatorColor,
      required this.indicatorIcon,
      required this.iconColor,
      required this.lineColor,
      this.padding,
      this.subTitle});
}
