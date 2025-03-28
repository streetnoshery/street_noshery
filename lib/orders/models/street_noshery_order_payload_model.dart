class CustomerOrderModel {
  final String customerId;
  final int shopId;
  final List<OrderItemModel> orderItems;

  CustomerOrderModel({
    required this.customerId,
    required this.shopId,
    required this.orderItems,
  });
}

class OrderItemModel {
  final String dishName;
  final String description;
  final String price;
  final int rating;
  final int foodId;

  OrderItemModel({
    required this.dishName,
    required this.description,
    required this.price,
    required this.rating,
    required this.foodId,
  });
}
