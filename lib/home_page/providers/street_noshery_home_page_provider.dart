import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryHomeProviders {
  static Future<ApiResponse> getMenu({int? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getMenu);
      final response = await api.request(
          apiString: finalUrl, method: "get", queryParams: {"shopId": shopId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> getReviews({int? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getReview);
      final response = await api.request(
          apiString: finalUrl, method: "get", queryParams: {"shopId": shopId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> updateFoodReview(
      {required List<num> foodIds,
      required int shopId,
      required num rating}) async {
    try {
      final String finalUrl =
          commonHost.url(StreetNosheryUrls.updateFoodReview);
      final response = await api.request(
          apiString: finalUrl,
          method: "post",
          payload: {"shopId": shopId, "stars": rating, "foodId": foodIds});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> getPastOrders({String? customerId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getPastOrders);
      final response = await api.request(
          apiString: finalUrl,
          method: "get",
          queryParams: {"customerId": customerId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
