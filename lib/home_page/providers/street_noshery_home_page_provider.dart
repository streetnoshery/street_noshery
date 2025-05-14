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
      final response = {
        "state": "SUCCESS",
        "status": 200,
        "data": {
          "_id": "67b1d6d6aae1dc9d6cb11226",
          "shopId": 1,
          "__v": 0,
          "createdAt": "2025-02-16T12:15:18.243Z",
          "menu": [
            {
              "dishName": "Chole kulche",
              "description": "Creamy tomato-based curry with paneer",
              "price": "250",
              "rating": 5,
              "foodId": 170263,
              "ratingCount": 1,
              "image": "assets/home/street_noshery_dark_green_logo.png",
              "category": "food"
            },
            {
              "dishName": "Paneer Masala",
              "description": "Creamy tomato-based curry with paneer",
              "price": "350",
              "rating": 5,
              "foodId": 639167,
              "ratingCount": 1,
              "category": "breakfast",
              "image": "assets/home/street_noshery_dark_green_logo.png"
            }
          ],
          "updatedAt": "2025-04-07T14:38:50.833Z"
        }
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "get",
      //     queryParams: {"shopId": shopId.toString()});

      return RepoResponse<StreetNosheryMenu>(
          data: StreetNosheryMenu.fromJson(
              response == '' ? {} : response["data"] as Map<String, dynamic>));
    } catch (e) {
      rethrow;
    }
  }

  Future<RepoResponse> getReviews({int? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getReview);
      final response = {
        "state": "SUCCESS",
        "status": 200,
        "data": {
          "shopId": 1,
          "totalRating": 10,
          "ratingCount": 2,
          "averageRating": 5
        }
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "get",
      //     queryParams: {"shopId": shopId.toString()});

      return RepoResponse<StreetNosheryShopRating>(
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
      final response = {
        "state": "SUCCESS",
        "status": 200,
        "data": [
          {
            "_id": "67f6cb689ce2a84ed79c0d6e",
            "orderTrackId": "vXI3OZw53DZyggN1",
            "__v": 0,
            "createdAt": "2025-04-09T19:32:56.601Z",
            "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
            "isOrderConfirmed": true,
            "isOrderDelivered": true,
            "isOrderFailed": false,
            "isOrderInProgress": false,
            "isOrderOutForDelivery": true,
            "isOrderPlaced": true,
            "isPaymentDone": true,
            "isorderCancelled": false,
            "orderItems": [
              {
                "dishName": "Chole kulche",
                "description":
                    "A rich and creamy tomato-based curry with paneer.",
                "price": "250",
                "rating": 4,
                "foodId": 170263,
                "count": 1
              },
              {
                "dishName": "Garlic Naan",
                "description":
                    "Soft Indian bread topped with garlic and butter.",
                "price": "50",
                "rating": 5,
                "foodId": 639167,
                "count": 2
              }
            ],
            "orderPlacedAt": "2025-04-09T19:32:56.600Z",
            "orderStatus": "DELIVERED",
            "paymentAmount": "350",
            "paymentId": "RRCNJIRUNSC_KJDCNJD",
            "paymentStatus": "SUCCESS",
            "razorpayOrderId": "RRCNJIRUNSC_KJDCNJD",
            "shopId": 1,
            "updatedAt": "2025-04-09T19:39:49.738Z",
            "orderConfirmedAt": "2025-04-09T19:34:00.824Z",
            "orderOutForDeliveryAt": "2025-04-09T19:38:41.928Z",
            "orderDeliveredAt": "2025-04-09T19:39:49.736Z"
          },
          {
            "_id": "67f6cb689ce2a84ed79c0d6e",
            "orderTrackId": "vXI3OZw53DZyggN2",
            "__v": 0,
            "createdAt": "2025-04-09T19:32:56.601Z",
            "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
            "isOrderConfirmed": true,
            "isOrderDelivered": true,
            "isOrderFailed": false,
            "isOrderInProgress": false,
            "isOrderOutForDelivery": true,
            "isOrderPlaced": true,
            "isPaymentDone": true,
            "isorderCancelled": false,
            "orderItems": [
              {
                "dishName": "Chole kulche",
                "description":
                    "A rich and creamy tomato-based curry with paneer.",
                "price": "250",
                "rating": 4,
                "foodId": 170263,
                "count": 1
              },
              {
                "dishName": "Garlic Naan",
                "description":
                    "Soft Indian bread topped with garlic and butter.",
                "price": "50",
                "rating": 5,
                "foodId": 639167,
                "count": 2
              }
            ],
            "orderPlacedAt": "2025-04-09T19:32:56.600Z",
            "orderStatus": "DELIVERED",
            "paymentAmount": "350",
            "paymentId": "RRCNJIRUNSC_KJDCNJD",
            "paymentStatus": "SUCCESS",
            "razorpayOrderId": "RRCNJIRUNSC_KJDCNJD",
            "shopId": 1,
            "updatedAt": "2025-04-09T19:39:49.738Z",
            "orderConfirmedAt": "2025-04-09T19:34:00.824Z",
            "orderOutForDeliveryAt": "2025-04-09T19:38:41.928Z",
            "orderDeliveredAt": "2025-04-09T19:39:49.736Z"
          },
          {
            "_id": "67f6cb689ce2a84ed79c0d6e",
            "orderTrackId": "vXI3OZw53DZyggN3",
            "__v": 0,
            "createdAt": "2025-04-09T19:32:56.601Z",
            "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
            "isOrderConfirmed": true,
            "isOrderDelivered": true,
            "isOrderFailed": false,
            "isOrderInProgress": false,
            "isOrderOutForDelivery": true,
            "isOrderPlaced": true,
            "isPaymentDone": true,
            "isorderCancelled": false,
            "orderItems": [
              {
                "dishName": "Chole kulche",
                "description":
                    "A rich and creamy tomato-based curry with paneer.",
                "price": "250",
                "rating": 4,
                "foodId": 170263,
                "count": 1
              },
              {
                "dishName": "Garlic Naan",
                "description":
                    "Soft Indian bread topped with garlic and butter.",
                "price": "50",
                "rating": 5,
                "foodId": 639167,
                "count": 2
              }
            ],
            "orderPlacedAt": "2025-04-09T19:32:56.600Z",
            "orderStatus": "DELIVERED",
            "paymentAmount": "350",
            "paymentId": "RRCNJIRUNSC_KJDCNJD",
            "paymentStatus": "SUCCESS",
            "razorpayOrderId": "RRCNJIRUNSC_KJDCNJD",
            "shopId": 1,
            "updatedAt": "2025-04-09T19:39:49.738Z",
            "orderConfirmedAt": "2025-04-09T19:34:00.824Z",
            "orderOutForDeliveryAt": "2025-04-09T19:38:41.928Z",
            "orderDeliveredAt": "2025-04-09T19:39:49.736Z"
          },
          {
            "_id": "67f6cb689ce2a84ed79c0d6e",
            "orderTrackId": "vXI3OZw53DZyggN4",
            "__v": 0,
            "createdAt": "2025-04-09T19:32:56.601Z",
            "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
            "isOrderConfirmed": true,
            "isOrderDelivered": true,
            "isOrderFailed": false,
            "isOrderInProgress": false,
            "isOrderOutForDelivery": true,
            "isOrderPlaced": true,
            "isPaymentDone": true,
            "isorderCancelled": false,
            "orderItems": [
              {
                "dishName": "Chole kulche",
                "description":
                    "A rich and creamy tomato-based curry with paneer.",
                "price": "250",
                "rating": 4,
                "foodId": 170263,
                "count": 1
              },
              {
                "dishName": "Garlic Naan",
                "description":
                    "Soft Indian bread topped with garlic and butter.",
                "price": "50",
                "rating": 5,
                "foodId": 639167,
                "count": 2
              }
            ],
            "orderPlacedAt": "2025-04-09T19:32:56.600Z",
            "orderStatus": "DELIVERED",
            "paymentAmount": "350",
            "paymentId": "RRCNJIRUNSC_KJDCNJD",
            "paymentStatus": "SUCCESS",
            "razorpayOrderId": "RRCNJIRUNSC_KJDCNJD",
            "shopId": 1,
            "updatedAt": "2025-04-09T19:39:49.738Z",
            "orderConfirmedAt": "2025-04-09T19:34:00.824Z",
            "orderOutForDeliveryAt": "2025-04-09T19:38:41.928Z",
            "orderDeliveredAt": "2025-04-09T19:39:49.736Z"
          }
        ]
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "get",
      //     queryParams: {"customerId": customerId});

      return RepoResponse<StreetNosheryPastorderDataResponseModel>(
          data: StreetNosheryPastorderDataResponseModel.fromJson(
              response == '' ? {} : response));
    } catch (e) {
      rethrow;
    }
  }
}
