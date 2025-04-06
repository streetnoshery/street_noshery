import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:street_noshery/common/common_date_format.dart';
import 'package:street_noshery/common/vertical_time_line_stapper.dart';
import 'package:street_noshery/common/vertivcal_time_line_common_class.dart';
import 'package:street_noshery/order_tracking/controller/street_noshery_order_tracking_controller.dart';
import 'package:street_noshery/order_tracking/enum/street_noshery_order_tracking_enum.dart';
import 'package:street_noshery/order_tracking/model/street_noshery_order_tracking_status_response_model.dart';

class StreetNosheryOrdertrackingView
    extends GetView<StreetNosheryOrderTrackingController> {
  const StreetNosheryOrdertrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Image.asset(controller.allImages.streetNosheryLogo,
                  height: 80, width: 80, fit: BoxFit.fill),
            ),
            StreetNosheryTimeLineTile(
                timeLineStapper: getTimeLinePayload(
                    controller.orderTrackingData.value.statusStack ?? []))
          ],
        ),
      );
    });
  }

  StreetNosheryTimeLineModel getTimeLinePayload(List<StatusStack> statusStack) {
    List<TimeLine> timeLineList = [];
    for (int index = 0; index < statusStack.length; index++) {
      final tile = TimeLine(
          isFirst: index == 0 ? true : false,
          isLast: index == statusStack.length - 1 ? true : false,
          isPast: false,
          title: statusStack[index].title ?? "",
          indicatorColor: getIndicatorColor(statusStack[index].status),
          indicatorIcon: getIndicatorIcon(statusStack[index].status),
          iconColor: Colors.white,
          lineColor: getLineColor(statusStack[index].status),
          subTitle: DateFormatter()
              .stringConvertDateFormat(statusStack[index].timeStamp));

      timeLineList.add(tile);
    }

    return StreetNosheryTimeLineModel(timeLine: timeLineList, height: 100);
  }

  Color getIndicatorColor(STATUS? status) {
    switch (status) {
      case STATUS.NOT_INITIATED:
        return Colors.grey;
      case STATUS.IN_PROGRESS:
        return Colors.yellow;
      case STATUS.SUCCESS:
        return Colors.green.shade600;
      default:
        return Colors.grey;
    }
  }

  IconData getIndicatorIcon(STATUS? status) {
    switch (status) {
      case STATUS.NOT_INITIATED:
        return Icons.access_time;
      case STATUS.IN_PROGRESS:
        return Icons.access_time_filled;
      case STATUS.SUCCESS:
        return Icons.done;
      default:
        return Icons.access_time;
    }
  }

  Color getLineColor(STATUS? status) {
    switch (status) {
      case STATUS.SUCCESS:
        return Colors.green.shade900;
      default:
        return Colors.grey;
    }
  }
}
