import 'package:street_noshery/cart/model/street_noshery_create_order_model.dart';
import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_exception_mapper.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/orders/models/street_noshery_order_payload_model.dart';
import 'package:street_noshery/orders/models/street_noshery_shop_order_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryShopOrdersProviders {
  // Private static variable to hold the singleton instance
  static final StreetNosheryShopOrdersProviders _instance =
      StreetNosheryShopOrdersProviders._internal();

  // Private constructor to prevent instantiation
  StreetNosheryShopOrdersProviders._internal();

  // Public factory constructor to return the singleton instance
  factory StreetNosheryShopOrdersProviders() {
    return _instance;
  }
  Future<RepoResponse> orderFT({CustomerOrderModel? payload}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createOrderFT);
      final response = await api.request(
          apiString: finalUrl, method: "post", payload: payload?.toJson());

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<OrderData>(
              data: OrderData.fromJson(response == ''
                  ? {}
                  : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> createOrder(
      {String? orderTrackId,
      required String customerId,
      required num shopId,
      required String paymentId,
      required String razorpayOrderId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createOrder);
      final response =
          await api.request(apiString: finalUrl, method: "post", payload: {
        "orderTrackId": orderTrackId,
        "customerId": customerId,
        "shopId": shopId,
        "paymentId": paymentId,
        "razorpayOrderId": razorpayOrderId
      });

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<OrderData>(
              data: OrderData.fromJson(response == ''
                  ? {}
                  : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> updateOrder(
      {required String orderTrackId,
      String? customerId,
      num? shopId,
      required String status}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.updateOrder);
      final response =
          await api.request(apiString: finalUrl, method: "patch", payload: {
        "orderTrackId": orderTrackId,
        "customerId": customerId,
        "shopId": shopId,
        "orderStatus": status
      });
      
      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<OrderData>(
              data: OrderData.fromJson(response == ''
                  ? {}
                  : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> getOrder({num? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getShopOrders);
      final response = await api.request(
          apiString: finalUrl, method: "get", queryParams: {"shopId": shopId});

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryShopDataResponseModel>(
              data: StreetNosheryShopDataResponseModel.fromJson(response == ''
                  ? {}
                  : response));
    } catch (e) {
      rethrow;
    }
  }
}
