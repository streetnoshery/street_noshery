import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/onboarding/enums/street_noshery_onboarding_status_enums.dart';
import 'package:street_noshery/onboarding/models/street_noshery_create_user_data_model.dart';

final api = API();

class StreetNosheryOnboardingProviders {
  static Future<ApiResponse> generateOtp(
      {String? mobileNumber, StreetNosheryOnboardingEnums? objective}) async {
    try {
      final response = await api.request(
          apiUri: Uri.parse(
              "http://15.206.99.178:3000/street-noshery/customer/generate-otp"),
          method: "post",
          payload: {
            "mobileNumber": mobileNumber,
            "reason":
                objective?.toString().split('.').last // Convert enum to string
          });

      return ApiResponse.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  static Future<ApiResponse> verifyotp(
      {String? mobileNumber,
      StreetNosheryOnboardingEnums? objective,
      String? otp}) async {
    final response = {"state": "SUCCESS", "status": 201, "data": "ok"};
    // await api.request(
    //     apiUri: Uri.parse("https://www.example.com/index.html"),
    //     method: "post",
    //     payload: {
    //       "mobileNumber": mobileNumber,
    //       "reason": objective,
    //       "otp": otp
    //     });
    return ApiResponse.fromJson(response);
  }

  static Future<ApiResponse> getUser(String mobileNumber) async {
    final response = {
      "state": "SUCCESS",
      "status": 201,
      "data": {
        "_id": "67b1c09aaae1dc9d6cb101f4",
        "mobileNumber": "8107748619",
        "__v": 0,
        "countryCode": "+91",
        "createdAt": "2025-02-16T10:40:26.496Z",
        "customerId": "STREET_NOSHERY_XL5VTH5U9WQ9PWOITIEV",
        "status": "USER_DETAILS_VERIFICATION",
        "updatedAt": "2025-02-27T17:22:14.256Z",
        "email": "sumit@gmail.com",
        "password": "Sumit@",
        "address": {
          "firstLine": "Sigma Tech Park",
          "secondLine": "Bangalore",
          "shopId": 1
        },
        "userName": "Sumit Kumar",
        "isEmailNotificationEnable": true
      }
    };
    // await api.request(
    //     apiUri: Uri.parse("https://www.example.com/index.html"),
    //     method: "get",
    //     queryParams: {
    //       "mobilenumber": mobileNumber
    //     }
    //     );

    return ApiResponse.fromJson(response);
  }

  static Future<ApiResponse> createUser(
      StreetNosheryCreateuserDatamodel data) async {
    final response = {
      "state": "SUCCESS",
      "status": 201,
      "data": {
        "_id": "67b1c09aaae1dc9d6cb101f4",
        "mobileNumber": "8107748619",
        "__v": 0,
        "countryCode": "+91",
        "createdAt": "2025-02-16T10:40:26.496Z",
        "customerId": "STREET_NOSHERY_XL5VTH5U9WQ9PWOITIEV",
        "status": "USER_DETAILS_VERIFICATION",
        "updatedAt": "2025-02-27T17:22:14.256Z",
        "email": "sumit@gmail.com",
        "password": "Sumit@",
        "address": {
          "firstLine": "Sigma Tech Park",
          "secondLine": "Bangalore",
          "shopId": 1
        },
        "userName": "Sumit Kumar",
        "isEmailNotificationEnable": true
      }
    };
    // await api.request(
    //   apiUri: Uri.parse("https://www.example.com/index.html"),
    //   method: "post",
    //   payload: data
    //   );

    return ApiResponse.fromJson(response);
  }
}
