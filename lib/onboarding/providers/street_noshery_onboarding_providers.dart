import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/onboarding/enums/street_noshery_onboarding_status_enums.dart';

final api = API();

class StreetNosheryOnboardingProviders {
  static Future<ApiResponse> generateOtp(
      {String? mobileNumber, StreetNosheryOnboardingEnums? objective}) async {
    final response = {"state": "SUCCESS", "status": 201, "data": "ok"};
    // await api.request(
    //   apiUri: Uri.parse("https://www.example.com/index.html"),
    //   method: "post",
    //   payload: {
    //     "mobileNumber": mobileNumber,
    //     "reason": objective.name
    //   }
    //   );

    return ApiResponse.fromJson(response);
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
}
