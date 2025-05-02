import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_exception_mapper.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryUserAccountProviders {
  // Private static variable to hold the singleton instance
  static final StreetNosheryUserAccountProviders _instance =
      StreetNosheryUserAccountProviders._internal();

  // Private constructor to prevent instantiation
  StreetNosheryUserAccountProviders._internal();

  // Public factory constructor to return the singleton instance
  factory StreetNosheryUserAccountProviders() {
    return _instance;
  }
  
  Future<RepoResponse> enableNotification(
      {String? customerId, bool? isEnable}) async {
    try {
      final String finalUrl =
          commonHost.url(StreetNosheryUrls.enableNotification);
      final response = await api.request(
          apiString: finalUrl,
          method: "post",
          payload: {"customerId": customerId, "isEnable": isEnable});

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryUser>(
          data: StreetNosheryUser.fromJson(response == '' ? {} : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }
}
