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
          "updatedAt": "2025-04-07T13:22:06.435Z",
          "email": "sumitgod510@gmail.com",
          "password": "Sumit@1062",
          "address": {
            "firstLine": "123 Main Street",
            "secondLine": "Apt 4BC",
            "shopId": 2
          },
          "userName": "Sumit Kumar Godwan"
        }
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "post",
      //     payload: {"customerId": customerId, "isEnable": isEnable});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
