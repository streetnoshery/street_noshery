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
      final response = {"state": "SUCCESS", "status": 201, "data": "ok"};
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
        "status": 201,
        "data": {
          "_id": "67f3c8a49ce2a84ed79bfe1f",
          "mobileNumber": "8107748619",
          "__v": 0,
          "countryCode": "+91",
          "createdAt": "2025-04-07T12:44:20.061Z",
          "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
          "isEmailNotificationEnable": true,
          "isRegisterForShop": false,
          "status": "USER_DETAILS_VERIFICATION",
          "updatedAt": "2025-04-07T12:48:34.457Z",
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
      final response = {
        "state": "SUCCESS",
        "status": 201,
        "data": {
          "_id": "67f3c8a49ce2a84ed79bfe1f",
          "mobileNumber": "8107748619",
          "__v": 0,
          "countryCode": "+91",
          "createdAt": "2025-04-07T12:44:20.061Z",
          "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
          "isEmailNotificationEnable": true,
          "isRegisterForShop": false,
          "status": "USER_DETAILS_VERIFICATION",
          "updatedAt": "2025-04-07T12:48:34.457Z",
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
      // await api.request(apiString: finalUrl, method: "post", payload: data);

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
