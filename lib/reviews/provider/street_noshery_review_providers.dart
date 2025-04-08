import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryReviewProviders {
  static Future<ApiResponse> updateReview(
      {num? shopId, String? customerId, num? ratings, String? reviews}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createReview);
      final response = {
        "state": "SUCCESS",
        "status": 201,
        "data": {
          "_id": "67f3e28c9ce2a84ed79c087e",
          "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
          "shopId": 1,
          "__v": 0,
          "createdAt": "2025-04-07T14:34:52.706Z",
          "rating": 5,
          "reviews": "Very tasty food",
          "updatedAt": "2025-04-07T14:34:52.706Z"
        }
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "post",
      //     payload: {
      //       "shopId": shopId,
      //       "customerId": customerId,
      //       "stars": ratings,
      //       "reviews": reviews
      //     });

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
