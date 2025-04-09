class CustomerOrderModel {
  final String customerId;
  final int shopId;
  final String paymentId;
  final String razorpayOrderId;
  final List<OrderItemModel> orderItems;

  CustomerOrderModel({
    required this.customerId,
    required this.shopId,
    required this.orderItems,
    required this.paymentId,
    required this.razorpayOrderId
  });
}

class OrderItemModel {
  final String dishName;
  final String description;
  final String price;
  final int rating;
  final int foodId;
  final int count;

  OrderItemModel({
    required this.dishName,
    required this.description,
    required this.price,
    required this.rating,
    required this.foodId,
    required this.count
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      dishName: json['dishName'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      rating: json['rating'],
      foodId: json['foodId'],
      count: json['count']
    );
  }
}
