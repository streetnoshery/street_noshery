import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_exception_mapper.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/onboarding/enums/street_noshery_onboarding_status_enums.dart';
import 'package:street_noshery/onboarding/models/street_noshery_create_user_data_model.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';
import 'package:street_noshery/onboarding/models/street_noshery_otp_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryOnboardingProviders {
  // Private static variable to hold the singleton instance
  static final StreetNosheryOnboardingProviders _instance =
      StreetNosheryOnboardingProviders._internal();

  // Private constructor to prevent instantiation
  StreetNosheryOnboardingProviders._internal();

  // Public factory constructor to return the singleton instance
  factory StreetNosheryOnboardingProviders() {
    return _instance;
  }

  Future<RepoResponse> generateOtp(
      {String? mobileNumber, StreetNosheryOnboardingEnums? objective}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.generateOtp);
      final response =
          await api.request(apiString: finalUrl, method: "post", payload: {
      "mobileNumber": mobileNumber,
      "reason":
      objective?.toString().split('.').last // Convert enum to string
      });

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryOtpResponse>(
          data: StreetNosheryOtpResponse.fromJson(
              response == '' ? {} : response));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> verifyotp(
      {String? mobileNumber,
      StreetNosheryOnboardingEnums? objective,
      String? otp}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.verifyOtp);
      final response =
          await api.request(apiString: finalUrl, method: "post", payload: {
        "mobileNumber": mobileNumber,
        "reason":
            objective?.toString().split('.').last, // Convert enum to string,
        "otp": otp
      });

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryOtpResponse>(
          data: StreetNosheryOtpResponse.fromJson(
              response == '' ? {} : response));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> getUser(String mobileNumber) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getUser);
      var response = await api.request(
          apiString: finalUrl,
          method: "get",
          queryParams: {"mobileNumber": mobileNumber});

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryUser>(
              data: StreetNosheryUser.fromJson(response == '' ? {} : response));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> createUser(
      StreetNosheryCreateuserDatamodel data) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createUser);
      final response = await api.request(
          apiString: finalUrl, method: "post", payload: data.toJson());

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryUser>(
              data: StreetNosheryUser.fromJson(response == '' ? {} : response));
    } catch (e) {
      rethrow;
    }
  }
}
