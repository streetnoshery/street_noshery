import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryOrderTrackingProvider {
  static Future<ApiResponse> getOrderStatus(String orderTrackId) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.orderStatus);
      final response = {
        "state": "SUCCESS",
        "status": 200,
        "data": {
          "flags": {
            "orderPlaced": "SUCCESS",
            "outForDelivery": "SUCCESS",
            "delivered": "SUCCESS"
          },
          "statusStack": [
            {
              "id": "orderPlaced",
              "status": "IN_PROGRESS",
              "title": "Order placed",
              // "timeStamp": "2025-03-28T17:13:56.513Z"
            },
            {
              "id": "outForDelivery",
              "status": "NOT_INITIATED",
              "title": "Out for delivery",
              // "timeStamp": "2025-03-28T17:15:14.682Z"
            },
            {
              "id": "delivered",
              "status": "NOT_INITIATED",
              "title": "Delivered",
              // "timeStamp": "2025-03-29T11:36:38.103Z"
            }
          ],
          "paymentStatus": "SUCCESS",
          "orderTrackId": "5SJjhzKXYTwv3lpc",
          "orderStatus": "DELIVERED",
          "orderConfirmedAt": "2025-03-28T17:13:56.513Z",
          "orderOutForDeliveryAt": "2025-03-28T17:15:14.682Z",
          "orderDeliveredAt": "2025-03-29T11:36:38.103Z",
          "isOrderPlaced": true,
          "isOrderOutForDelivery": true,
          "isOrderConfirmed": true,
          "isOrderDelivered": true,
          "isOrderFailed": false,
          "isorderCancelled": false
        }
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "get",
      //     queryParams: {"orderTrackId": orderTrackId});
      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
