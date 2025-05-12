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
      final response = {"state": "SUCCESS", "status": 201, "data": "ok"};
      //     await api.request(apiString: finalUrl, method: "post", payload: {
      // "mobileNumber": mobileNumber,
      // "reason":
      // objective?.toString().split('.').last // Convert enum to string
      // });

      return RepoResponse<StreetNosheryOtpResponse>(
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
      final response = {"state": "SUCCESS", "status": 201, "data": "ok"};
      //     await api.request(apiString: finalUrl, method: "post", payload: {
      // "mobileNumber": mobileNumber,
      // "reason":
      // objective?.toString().split('.').last, // Convert enum to string,
      // "otp": otp
      // });

      return RepoResponse<StreetNosheryOtpResponse>(
          data: StreetNosheryOtpResponse.fromJson(
              response == '' ? {} : response));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> getUser(String mobileNumber) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getUser);
      var response = {
        "state": "SUCCESS",
        "status": 200,
        "data": {
          "_id": "680382969ce2a84ed79c5f60",
          "mobileNumber": "8107748619",
          "__v": 0,
          "countryCode": "+91",
          "createdAt": "2025-04-19T11:01:42.100Z",
          "customerId": "STREET_NOSHERY_TF6W36LQW9BPDOY5J6ZS",
          "isEmailNotificationEnable": true,
          "isRegisterForShop": false,
          "status": "USER_DETAILS_VERIFICATION",
          "updatedAt": "2025-04-20T11:42:55.792Z",
          "email": "sumitgod510@gmail.com",
          "password": "Sumit@1062",
          "address": {
            "firstLine": "Sigma Tech Park",
            "secondLine": "Bangalore",
            "shopId": 1
          },
          "userName": "Sumit Kumar Godwan"
        }
      };
      // await api.request(
      // apiString: finalUrl,
      // method: "get",
      // queryParams: {"mobileNumber": mobileNumber});

      return RepoResponse<StreetNosheryUser>(
          data: StreetNosheryUser.fromJson(
              response == '' ? {} : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> createUser(StreetNosheryCreateuserDatamodel data) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createUser);
      final response = await api.request(
          apiString: finalUrl, method: "post", payload: data.toJson());

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryUser>(
              data: StreetNosheryUser.fromJson(response == ''
                  ? {}
                  : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }
}
