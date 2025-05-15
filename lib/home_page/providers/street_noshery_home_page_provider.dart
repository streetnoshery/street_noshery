import 'dart:convert';

import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_exception_mapper.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';
import 'package:street_noshery/home_page/models/street_noshery_past_orders_model.dart';
import 'package:street_noshery/reviews/model/street_noshery_rating_review.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryHomeProviders {
  static final StreetNosheryHomeProviders _instance =
      StreetNosheryHomeProviders._internal();

  // Private constructor to prevent instantiation
  StreetNosheryHomeProviders._internal();

  // Public factory constructor to return the singleton instance
  factory StreetNosheryHomeProviders() {
    return _instance;
  }

  Future<RepoResponse> getMenu({int? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getMenu);
      final response = await api.request(
          apiString: finalUrl,
          method: "get",
          queryParams: {"shopId": shopId.toString()});

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryMenu>(
              data: StreetNosheryMenu.fromJson(response == ''
                  ? {}
                  : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> getReviews({int? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getReview);
      final response = await api.request(
          apiString: finalUrl,
          method: "get",
          queryParams: {"shopId": shopId.toString()});

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryShopRating>(
              data: StreetNosheryShopRatingMapper.fromJson(
                  response == '' ? "" : jsonEncode(response["data"])));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> updateFoodReview(
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

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<dynamic>(data: response);
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> getPastOrders({String? customerId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getPastOrders);
      final response = await api.request(
          apiString: finalUrl,
          method: "get",
          queryParams: {"customerId": customerId});

      return response is ApiException
          ? RepoResponse<ApiException>(error: response, data: null)
          : RepoResponse<StreetNosheryPastorderDataResponseModel>(
              data: StreetNosheryPastorderDataResponseModel.fromJson(
                  response == '' ? {} : response));
    } catch (e) {
      rethrow;
    }
  }
}
