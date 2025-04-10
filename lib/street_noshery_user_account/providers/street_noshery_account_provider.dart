import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryUserAccountProviders {
  static Future<ApiResponse> enableNotification(
      {String? customerId, bool? isEnable}) async {
    try {
      final String finalUrl =
          commonHost.url(StreetNosheryUrls.enableNotification);
      final response = await api.request(
          apiString: finalUrl,
          method: "post",
          payload: {"customerId": customerId, "isEnable": isEnable});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
