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
      final response = await api.request(
          apiString: finalUrl,
          method: "post",
          payload: {
            "shopId": shopId,
            "customerId": customerId,
            "stars": ratings,
            "reviews": reviews
          });

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // TODO: Not used
  static Future<ApiResponse> getReview(num? shopId) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.createReview);
      final response =
          await api.request(apiString: finalUrl, method: "post", queryParams: {"shopId": shopId});
      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
