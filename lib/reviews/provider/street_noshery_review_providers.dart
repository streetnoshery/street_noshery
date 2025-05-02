import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_exception_mapper.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/reviews/model/street_noshery_review_model.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryReviewProviders {
  // Private static variable to hold the singleton instance
  static final StreetNosheryReviewProviders _instance =
      StreetNosheryReviewProviders._internal();

  // Private constructor to prevent instantiation
  StreetNosheryReviewProviders._internal();

  // Public factory constructor to return the singleton instance
  factory StreetNosheryReviewProviders() {
    return _instance;
  }
  Future<RepoResponse> updateReview(
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

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryReviewmodel>(
              data: StreetNosheryReviewmodel.fromJson(response == ''
                  ? {}
                  : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }
}
