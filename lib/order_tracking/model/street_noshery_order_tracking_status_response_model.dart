import 'package:street_noshery/order_tracking/enum/street_noshery_order_tracking_enum.dart';

class OrderTrackingModel {
  final String? state;
  final int? status;
  final OrderTrackingData? data;

  OrderTrackingModel({this.state, this.status, this.data});

  factory OrderTrackingModel.fromJson(Map<String, dynamic> json) {
    return OrderTrackingModel(
      state: json['state'] as String?,
      status: json['status'] as int?,
      data: json['data'] != null
          ? OrderTrackingData.fromJson(json['data'])
          : null,
    );
  }
}

class OrderTrackingData {
  final Flags? flags;
  final List<StatusStack>? statusStack;
  final String? paymentStatus;
  final bool? isPaymentDone;
  final String? orderTrackId;
  final String? orderStatus;
  final String? orderConfirmedAt;
  final String? orderOutForDeliveryAt;
  final String? orderDeliveredAt;
  final bool? isOrderPlaced;
  final String? orderPlacedAt;
  final bool? isOrderOutForDelivery;
  final bool? isOrderConfirmed;
  final bool? isOrderDelivered;
  final bool? isOrderFailed;
  final bool? isOrderCancelled;
  final String? orderFailedAt;
  final String? paymentAmount;
  final String? customerId;
  final String? orderCancelledAt;

  OrderTrackingData(
      {this.flags,
      this.statusStack,
      this.paymentStatus,
      this.orderTrackId,
      this.orderStatus,
      this.orderConfirmedAt,
      this.orderOutForDeliveryAt,
      this.orderDeliveredAt,
      this.isOrderPlaced,
      this.isOrderOutForDelivery,
      this.isOrderConfirmed,
      this.isOrderDelivered,
      this.isOrderFailed,
      this.isOrderCancelled,
      this.orderFailedAt,
      this.orderCancelledAt,
      this.isPaymentDone,
      this.customerId,
      this.orderPlacedAt,
      this.paymentAmount});

  factory OrderTrackingData.fromJson(Map<String, dynamic> json) {
    return OrderTrackingData(
      flags: json['flags'] != null ? Flags.fromJson(json['flags']) : null,
      statusStack: (json['statusStack'] as List<dynamic>?)
          ?.map((item) => StatusStack.fromJson(item))
          .toList(),
      paymentStatus: json['paymentStatus'] as String?,
      orderTrackId: json['orderTrackId'] as String?,
      orderStatus: json['orderStatus'] as String?,
      orderConfirmedAt: json['orderConfirmedAt'] as String?,
      orderOutForDeliveryAt: json['orderOutForDeliveryAt'] as String?,
      orderDeliveredAt: json['orderDeliveredAt'] as String?,
      isOrderPlaced: json['isOrderPlaced'] as bool?,
      isOrderOutForDelivery: json['isOrderOutForDelivery'] as bool?,
      isOrderConfirmed: json['isOrderConfirmed'] as bool?,
      isOrderDelivered: json['isOrderDelivered'] as bool?,
      isOrderFailed: json['isOrderFailed'] as bool?,
      isOrderCancelled: json['isorderCancelled'] as bool?,
      orderFailedAt: json['orderFailedAt'] as String?,
      orderCancelledAt: json['orderCancelledAt'] as String?,
      isPaymentDone: json['isPaymentDone'] as bool?,
      customerId: json['customerId'] as String?,
      orderPlacedAt: json['orderPlacedAt'] as String?,
      paymentAmount: json['paymentAmount']
          as String?,
    );
  }
}

class Flags {
  final String? orderPlaced;
  final String? outForDelivery;
  final String? delivered;

  Flags({this.orderPlaced, this.outForDelivery, this.delivered});

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      orderPlaced: json['orderPlaced'] as String?,
      outForDelivery: json['outForDelivery'] as String?,
      delivered: json['delivered'] as String?,
    );
  }
}

class StatusStack {
  final String? id;
  final STATUS? status;
  final String? title;
  final String? timeStamp;

  StatusStack({this.id, this.status, this.title, this.timeStamp});

  factory StatusStack.fromJson(Map<String, dynamic> json) {
    return StatusStack(
      id: json['id'] as String?,
      status: json['status'] != null
          ? STATUS.values.firstWhere(
              (e) =>
                  e.name.toLowerCase() ==
                  (json['status'] as String).toLowerCase(),
              orElse: () => STATUS.UNKNOWN,
            )
          : null,
      title: json['title'] as String?,
      timeStamp: json['timeStamp'] as String?,
    );
  }
}
