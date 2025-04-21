import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';

class CustomerOrderModel {
  final String customerId;
  final int shopId;
  final String paymentId;
  final String razorpayOrderId;
  final List<MenuItem> orderItems;

  CustomerOrderModel({
    required this.customerId,
    required this.shopId,
    required this.orderItems,
    required this.paymentId,
    required this.razorpayOrderId,
  });

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'shopId': shopId,
      'paymentId': paymentId,
      'razorpayOrderId': razorpayOrderId,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }
}
