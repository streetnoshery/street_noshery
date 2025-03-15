import 'dart:convert';

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
  final List<OrderItem>? orderItems;
  final DateTime? orderPlacedAt;
  final String? orderStatus;
  final String? paymentStatus;
  final String? shopId;
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
        orderItems: (json['orderItems'] as List<dynamic>?)?.map((e) => OrderItem.fromJson(e)).toList(),
        orderPlacedAt: json['orderPlacedAt'] != null ? DateTime.parse(json['orderPlacedAt']) : null,
        orderStatus: json['orderStatus'] as String?,
        paymentStatus: json['paymentStatus'] as String?,
        shopId: json['shopId'] as String?,
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

class OrderItem {
  final String? dishName;
  final String? description;
  final String? price;
  final double? rating;
  final int? foodId;

  OrderItem({this.dishName, this.description, this.price, this.rating, this.foodId});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        dishName: json['dishName'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        rating: (json['rating'] as num?)?.toDouble(),
        foodId: json['foodId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'dishName': dishName,
        'description': description,
        'price': price,
        'rating': rating,
        'foodId': foodId,
      };
}

StreetNosheryPastOrdersModel parseStreetNosheryPastOrders(String jsonString) {
  return StreetNosheryPastOrdersModel.fromJson(json.decode(jsonString));
}

