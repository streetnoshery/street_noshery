import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryAddressProviders {
  static Future<ApiResponse> updateAddress(
      {String? firstLine,
      String? secondLine,
      num? shopId,
      String? customerId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.updateAddress);
      final response = await api.request(
          apiString: finalUrl,
          method: "patch",
          payload: {firstLine, secondLine, shopId, customerId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
