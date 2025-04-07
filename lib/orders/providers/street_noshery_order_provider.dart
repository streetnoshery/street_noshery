import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/orders/models/street_noshery_order_payload_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryShopOrdersProviders {
  static Future<ApiResponse> orderFT({CustomerOrderModel? payload}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createOrderFT);
      final response = {
    "state": "SUCCESS",
    "status": 201,
    "data": {
        "_id": "67f394649ce2a84ed79bf7bc",
        "orderTrackId": "MondhBb11Gl1n2yg",
        "__v": 0,
        "createdAt": "2025-04-07T09:01:24.496Z",
        "customerId": "12345",
        "isOrderConfirmed": true,
        "isOrderDelivered": false,
        "isOrderFailed": false,
        "isOrderInProgress": true,
        "isOrderOutForDelivery": false,
        "isOrderPlaced": true,
        "isPaymentDone": true,
        "isorderCancelled": false,
        "orderItems": [
            {
                "dishName": "Paneer Butter Masala",
                "description": "A rich and creamy tomato-based curry with paneer.",
                "price": "250",
                "rating": 4,
                "foodId": 101
            },
            {
                "dishName": "Garlic Naan",
                "description": "Soft Indian bread topped with garlic and butter.",
                "price": "50",
                "rating": 5,
                "foodId": 102
            }
        ],
        "orderPlacedAt": "2025-04-07T09:01:24.494Z",
        "orderStatus": "CONFIRMED",
        "paymentAmount": "NaN",
        "paymentStatus": "SUCCESS",
        "shopId": 678,
        "updatedAt": "2025-04-07T09:47:10.555Z",
        "orderConfirmedAt": "2025-04-07T09:47:10.553Z"
    }
};
      // await api.request(
      //     apiString: finalUrl, method: "post", payload: payload);

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> createOrder(
      {String? orderTrackId, String? customerId, num? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createOrder);
      final response = {
    "state": "SUCCESS",
    "status": 201,
    "data": {
        "_id": "67f394649ce2a84ed79bf7bc",
        "orderTrackId": "MondhBb11Gl1n2yg",
        "__v": 0,
        "createdAt": "2025-04-07T09:01:24.496Z",
        "customerId": "12345",
        "isOrderConfirmed": true,
        "isOrderDelivered": false,
        "isOrderFailed": false,
        "isOrderInProgress": true,
        "isOrderOutForDelivery": false,
        "isOrderPlaced": true,
        "isPaymentDone": true,
        "isorderCancelled": false,
        "orderItems": [
            {
                "dishName": "Paneer Butter Masala",
                "description": "A rich and creamy tomato-based curry with paneer.",
                "price": "250",
                "rating": 4,
                "foodId": 101
            },
            {
                "dishName": "Garlic Naan",
                "description": "Soft Indian bread topped with garlic and butter.",
                "price": "50",
                "rating": 5,
                "foodId": 102
            }
        ],
        "orderPlacedAt": "2025-04-07T09:01:24.494Z",
        "orderStatus": "CONFIRMED",
        "paymentAmount": "NaN",
        "paymentStatus": "SUCCESS",
        "shopId": 678,
        "updatedAt": "2025-04-07T09:47:10.555Z",
        "orderConfirmedAt": "2025-04-07T09:47:10.553Z"
    }
};
      // await api.request(
      //     apiString: finalUrl,
      //     method: "post",
      //     payload: {orderTrackId, customerId, shopId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> updateOrder(
      {String? orderTrackId,
      String? customerId,
      num? shopId,
      String? status}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.updateOrder);
      final response = await api.request(
          apiString: finalUrl,
          method: "patch",
          payload: {orderTrackId, customerId, shopId, status});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> getOrder({num? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getShopOrders);
      final response = await api.request(
          apiString: finalUrl, method: "get", queryParams: {"shopId": shopId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
