import 'package:flutter/material.dart';
import 'package:street_noshery/common/vertivcal_time_line_common_class.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StreetNosheryTimeLineTile extends StatelessWidget {
  final StreetNosheryTimeLineModel timeLineStapper;
  const StreetNosheryTimeLineTile(
      {super.key,
      required this.timeLineStapper});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: timeLineStapper.padding?.toDouble() ?? 20),
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 20),
          shrinkWrap: true,
          itemCount: timeLineStapper.timeLine.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: timeLineStapper.height?.toDouble(),
              child: TimelineTile(
                isFirst: (index == 0) ? timeLineStapper.timeLine[index].isFirst : false,
                isLast: (index == 2) ? timeLineStapper.timeLine[index].isLast : false,
                beforeLineStyle: LineStyle(
                  color: timeLineStapper.timeLine[index].lineColor,
                  thickness: 2,
                ),
                indicatorStyle: IndicatorStyle(
                  color: timeLineStapper.timeLine[index].indicatorColor,
                  iconStyle: IconStyle(
                    iconData: timeLineStapper.timeLine[index].indicatorIcon, // Use any icon you want here
                    color: timeLineStapper.timeLine[index].iconColor,
                  ),
                ),
                endChild: Padding(
                  padding: EdgeInsets.only(left: 20, top: (timeLineStapper.height?.toDouble() ?? 0)/3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timeLineStapper.timeLine[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        timeLineStapper.timeLine[index].subTitle ?? "",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
