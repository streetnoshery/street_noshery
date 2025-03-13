import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();

class StreetNosheryReviewProviders {
  static Future<ApiResponse> updateReview({
    num? shopId,
    String? customerId,
    num? ratings,
    String? reviews
  }) async {
    final response = {
  "state": "SUCCESS",
  "status": 201,
  "data": {
    "_id": "67d2c9aaaae1dc9d6cb239d6",
    "customerId": "STREET_NOSHERY_12345",
    "shopId": 2,
    "__v": 0,
    "createdAt": "2025-03-13T12:03:54.098Z",
    "reviews": "kjnfjvnf",
    "updatedAt": "2025-03-13T12:38:02.995Z",
    "rating": 4
  }
};
    // await api.request(
    //     apiUri: Uri.parse("https://www.example.com/index.html"),
    //     method: "post",
    //     payload: {
    //       "shopId": shopId,
    //       "customerId": customerId,
    //       "stars": ratings,
    //       "reviews": reviews
    //     });

    return ApiResponse.fromJson(response);
  }

  static Future<ApiResponse> getReview() async {
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
