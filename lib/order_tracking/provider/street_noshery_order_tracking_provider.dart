import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryOrderTrackingProvider {
  static Future<ApiResponse> getOrderStatus(String orderTrackId) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.orderStatus);
      final response = await api.request(
          apiString: finalUrl,
          method: "get",
          queryParams: {"orderTrackId": orderTrackId});
      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
