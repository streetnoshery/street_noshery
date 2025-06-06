class OrderResponse {
  final String? state;
  final num? status;
  final OrderData? data;

  OrderResponse({this.state, this.status, this.data});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      state: json['state'] as String?,
      status: json['status'] as num?,
      data: json['data'] != null ? OrderData.fromJson(json['data']) : null,
    );
  }
}

class OrderData {
  final String? id;
  final String? orderTrackId;
  final num? v;
  final DateTime? createdAt;
  final String? customerId;
  final bool? isOrderConfirmed;
  final bool? isOrderDelivered;
  final bool? isOrderFailed;
  final bool? isOrderInProgress;
  final bool? isOrderOutForDelivery;
  final bool? isOrderPlaced;
  final bool? isPaymentDone;
  final bool? isOrderCancelled;
  final List<OrderItem>? orderItems;
  final DateTime? orderPlacedAt;
  final String? orderStatus;
  final num? paymentAmount;
  final String? paymentStatus;
  final num? shopId;
  final DateTime? updatedAt;
  final DateTime? orderConfirmedAt;
  final String? paymentId;
  final String? razorpayOrderId;

  OrderData({
    this.id,
    this.orderTrackId,
    this.v,
    this.createdAt,
    this.customerId,
    this.isOrderConfirmed,
    this.isOrderDelivered,
    this.isOrderFailed,
    this.isOrderInProgress,
    this.isOrderOutForDelivery,
    this.isOrderPlaced,
    this.isPaymentDone,
    this.isOrderCancelled,
    this.orderItems,
    this.orderPlacedAt,
    this.orderStatus,
    this.paymentAmount,
    this.paymentStatus,
    this.shopId,
    this.updatedAt,
    this.orderConfirmedAt,
    this.paymentId,
    this.razorpayOrderId
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['_id'] as String?,
      orderTrackId: json['orderTrackId'] as String?,
      v: json['__v'] as num?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      customerId: json['customerId'] as String?,
      isOrderConfirmed: json['isOrderConfirmed'] as bool?,
      isOrderDelivered: json['isOrderDelivered'] as bool?,
      isOrderFailed: json['isOrderFailed'] as bool?,
      isOrderInProgress: json['isOrderInProgress'] as bool?,
      isOrderOutForDelivery: json['isOrderOutForDelivery'] as bool?,
      isOrderPlaced: json['isOrderPlaced'] as bool?,
      isPaymentDone: json['isPaymentDone'] as bool?,
      isOrderCancelled: json['isorderCancelled'] as bool?, // notice: typo in key
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((item) => OrderItem.fromJson(item))
          .toList(),
      orderPlacedAt: json['orderPlacedAt'] != null ? DateTime.tryParse(json['orderPlacedAt']) : null,
      orderStatus: json['orderStatus'] as String?,
      paymentAmount: _parseDouble(json['paymentAmount']),
      paymentStatus: json['paymentStatus'] as String?,
      shopId: json['shopId'] as num?,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      orderConfirmedAt: json['orderConfirmedAt'] != null ? DateTime.tryParse(json['orderConfirmedAt']) : null,
      paymentId: json['paymentId'],
      razorpayOrderId: json['razorpayOrderId']
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    try {
      final parsed = double.tryParse(value.toString());
      return parsed?.isNaN ?? true ? null : parsed;
    } catch (_) {
      return null;
    }
  }
}

class OrderItem {
  final String? dishName;
  final String? description;
  final String? price;
  final num? rating;
  final num? foodId;
  final num? count;

  OrderItem({
    this.dishName,
    this.description,
    this.price,
    this.rating,
    this.foodId,
    this.count
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      dishName: json['dishName'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      rating: json['rating'] as num?,
      foodId: json['foodId'] as num?,
      count: json['count'] as num?
    );
  }
}
