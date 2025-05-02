import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_exception_mapper.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryAddressProviders {
  // Private static variable to hold the singleton instance
  static final StreetNosheryAddressProviders _instance =
      StreetNosheryAddressProviders._internal();

  // Private constructor to prevent instantiation
  StreetNosheryAddressProviders._internal();

  // Public factory constructor to return the singleton instance
  factory StreetNosheryAddressProviders() {
    return _instance;
  }
  Future<RepoResponse> updateAddress(
      {String? firstLine,
      String? secondLine,
      num? shopId,
      String? customerId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.updateAddress);
      final response = await api.request(
          apiString: finalUrl,
          method: "patch",
          payload: {"firstLine": firstLine, "secondLine": secondLine, "shopId": shopId, "customerId": customerId});

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryUser>(
          data: StreetNosheryUser.fromJson(response == '' ? {} : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }
}
