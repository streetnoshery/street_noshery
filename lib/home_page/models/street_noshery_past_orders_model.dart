import 'dart:convert';

import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';

class StreetNosheryPastorderDataResponseModel {
  String? state;
  int? status;
  List<StreetNosheryPastOrdersModel>? data;

  StreetNosheryPastorderDataResponseModel({this.state, this.status, this.data});

  StreetNosheryPastorderDataResponseModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    status = json['status'];
    if (json['data'] != null) {
      data = <StreetNosheryPastOrdersModel>[];
      json['data'].forEach((v) {
        data!.add(StreetNosheryPastOrdersModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StreetNosheryPastOrdersModel {
  final String? id;
  final String? orderTrackId;
  final int? version;
  final DateTime? createdAt;
  final String? customerId;
  final bool? isOrderConfirmed;
  final bool? isOrderDelivered;
  final bool? isOrderInProgress;
  final bool? isOrderOutForDelivery;
  final bool? isOrderPlaced;
  final bool? isPaymentDone;
  final bool? isOrderCancelled;
  final List<MenuItem>? orderItems;
  final DateTime? orderPlacedAt;
  final String? orderStatus;
  final String? paymentStatus;
  final num? shopId;
  final DateTime? updatedAt;
  final DateTime? orderDeliveredAt;

  StreetNosheryPastOrdersModel({
    this.id,
    this.orderTrackId,
    this.version,
    this.createdAt,
    this.customerId,
    this.isOrderConfirmed,
    this.isOrderDelivered,
    this.isOrderInProgress,
    this.isOrderOutForDelivery,
    this.isOrderPlaced,
    this.isPaymentDone,
    this.isOrderCancelled,
    this.orderItems,
    this.orderPlacedAt,
    this.orderStatus,
    this.paymentStatus,
    this.shopId,
    this.updatedAt,
    this.orderDeliveredAt,
  });

  factory StreetNosheryPastOrdersModel.fromJson(Map<String, dynamic> json) => StreetNosheryPastOrdersModel(
        id: json['_id'] as String?,
        orderTrackId: json['orderTrackId'] as String?,
        version: json['__v'] as int?,
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
        customerId: json['customerId'] as String?,
        isOrderConfirmed: json['isOrderConfirmed'] as bool?,
        isOrderDelivered: json['isOrderDelivered'] as bool?,
        isOrderInProgress: json['isOrderInProgress'] as bool?,
        isOrderOutForDelivery: json['isOrderOutForDelivery'] as bool?,
        isOrderPlaced: json['isOrderPlaced'] as bool?,
        isPaymentDone: json['isPaymentDone'] as bool?,
        isOrderCancelled: json['isOrderCancelled'] as bool?,
        orderItems: (json['orderItems'] as List<dynamic>?)?.map((e) => MenuItem.fromJson(e)).toList(),
        orderPlacedAt: json['orderPlacedAt'] != null ? DateTime.parse(json['orderPlacedAt']) : null,
        orderStatus: json['orderStatus'] as String?,
        paymentStatus: json['paymentStatus'] as String?,
        shopId: json['shopId'] as num?,
        updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
        orderDeliveredAt: json['orderDeliveredAt'] != null ? DateTime.parse(json['orderDeliveredAt']) : null,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'orderTrackId': orderTrackId,
        '__v': version,
        'createdAt': createdAt?.toIso8601String(),
        'customerId': customerId,
        'isOrderConfirmed': isOrderConfirmed,
        'isOrderDelivered': isOrderDelivered,
        'isOrderInProgress': isOrderInProgress,
        'isOrderOutForDelivery': isOrderOutForDelivery,
        'isOrderPlaced': isOrderPlaced,
        'isPaymentDone': isPaymentDone,
        'isOrderCancelled': isOrderCancelled,
        'orderItems': orderItems?.map((e) => e.toJson()).toList(),
        'orderPlacedAt': orderPlacedAt?.toIso8601String(),
        'orderStatus': orderStatus,
        'paymentStatus': paymentStatus,
        'shopId': shopId,
        'updatedAt': updatedAt?.toIso8601String(),
        'orderDeliveredAt': orderDeliveredAt?.toIso8601String(),
      };
}

StreetNosheryPastOrdersModel parseStreetNosheryPastOrders(String jsonString) {
  return StreetNosheryPastOrdersModel.fromJson(json.decode(jsonString));
}

