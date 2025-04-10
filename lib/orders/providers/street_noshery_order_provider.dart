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
      final response = await api.request(
          apiString: finalUrl, method: "post", payload: payload);

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> createOrder(
      {String? orderTrackId, String? customerId, num? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createOrder);
      final response = await api.request(
          apiString: finalUrl,
          method: "post",
          payload: {orderTrackId, customerId, shopId});

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
