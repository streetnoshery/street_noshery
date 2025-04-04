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
      final response = {"state": "SUCCESS", "status": 201, "data": "ok"};
      //     await api.request(apiString: finalUrl, method: "post", payload: {
      //   "mobileNumber": mobileNumber,
      //   "reason":
      //       objective?.toString().split('.').last // Convert enum to string
      // });

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
      final response = {"state":"SUCCESS","status":201,"data":"ok"};
      // await api.request(
      //     apiString: finalUrl,
      //     method: "post",
      //     payload: {
      //       "mobileNumber": mobileNumber,
      //       "reason": objective,
      //       "otp": otp
      //     });

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> getUser(String mobileNumber) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getUser);
      final response = {
        "state": "SUCCESS",
        "status": 200,
        "data": {
          "address": {
            "firstLine": "Sigma Tech Park",
            "secondLine": "Bangalore",
            "shopId": 1
          },
          "_id": "67e40e954489a7f21678a932",
          "mobileNumber": "8310627564",
          "__v": 0,
          "countryCode": "+91",
          "createdAt": "2025-03-26T14:26:29.790Z",
          "customerId": "STREET_NOSHERY_DJ9Q0M3N848PUAJF5PL5",
          "isEmailNotificationEnable": false,
          "isRegisterForShop": false,
          "status": "USER_DETAILS_VERIFICATION",
          "updatedAt": "2025-03-26T14:35:57.424Z",
          "email": "Sumitgod510@gmail.com",
          "password": "Sumitgod510@gmail.com",
          "userName": "Sumit Kumar Godwan"
        }
      };
      // await api.request(
      //   apiString: finalUrl,
      //   method: "get",
      //   queryParams: {
      //     "mobilenumber": mobileNumber
      //   }
      //   );

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> createUser(
      StreetNosheryCreateuserDatamodel data) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createUser);
      final response =
          await api.request(apiString: finalUrl, method: "post", payload: data);

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
