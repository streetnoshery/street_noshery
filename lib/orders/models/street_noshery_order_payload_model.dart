import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';

class CustomerOrderModel {
  final String customerId;
  final int shopId;
  final List<MenuItem> orderItems;
  final num amount;

  CustomerOrderModel({
    required this.customerId,
    required this.shopId,
    required this.orderItems,
    required this.amount
  });

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'shopId': shopId,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
      'amount': amount
    };
  }
}
