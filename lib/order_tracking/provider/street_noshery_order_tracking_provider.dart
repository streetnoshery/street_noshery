import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_exception_mapper.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/order_tracking/model/street_noshery_order_tracking_status_response_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryOrderTrackingProvider {
  // Private static variable to hold the singleton instance
  static final StreetNosheryOrderTrackingProvider _instance =
      StreetNosheryOrderTrackingProvider._internal();

  // Private constructor to prevent instantiation
  StreetNosheryOrderTrackingProvider._internal();

  // Public factory constructor to return the singleton instance
  factory StreetNosheryOrderTrackingProvider() {
    return _instance;
  }
  Future<RepoResponse> getOrderStatus(String orderTrackId) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.orderStatus);
      final response = await api.request(
          apiString: finalUrl,
          method: "get",
          queryParams: {"orderTrackId": orderTrackId});
      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<OrderTrackingData>(
              data: OrderTrackingData.fromJson(response == ''
                  ? {}
                  : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }
}
