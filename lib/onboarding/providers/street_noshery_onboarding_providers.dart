import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/onboarding/enums/street_noshery_onboarding_status_enums.dart';
import 'package:street_noshery/onboarding/models/street_noshery_create_user_data_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryOnboardingProviders {
  static Future<ApiResponse> generateOtp(
      {String? mobileNumber, StreetNosheryOnboardingEnums? objective}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.generateOtp);
      final response =
          await api.request(apiString: finalUrl, method: "post", payload: {
        "mobileNumber": mobileNumber,
        "reason":
            objective?.toString().split('.').last // Convert enum to string
      });

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> verifyotp(
      {String? mobileNumber,
      StreetNosheryOnboardingEnums? objective,
      String? otp}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.verifyOtp);
      final response = await api.request(
          apiString: finalUrl,
          method: "post",
          payload: {
            "mobileNumber": mobileNumber,
            "reason": objective,
            "otp": otp
          });

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> getUser(String mobileNumber) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getUser);
      final response =  await api.request(
        apiString: finalUrl,
        method: "get",
        queryParams: {
          "mobilenumber": mobileNumber
        }
        );

    return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> createUser(
      StreetNosheryCreateuserDatamodel data) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createUser);
      final response = await api.request(
      apiString: finalUrl,
      method: "post",
      payload: data
      );

    return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
