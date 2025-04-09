import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_host.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();
final commonHost = StreetNosheryCommonHost();

class StreetNosheryHomeProviders {
  static Future<ApiResponse> getMenu({int? shopId}) async {
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
              "dishName": "Paneer Tikka ",
              "description": "Veggy with paneer",
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
      //     apiString: finalUrl, method: "get", queryParams: {"shopId": shopId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> getReviews({int? shopId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getReview);
      final response = {
        "state": "SUCCESS",
        "status": 200,
        "data": {
          "shopId": 1,
          "totalRating": 5,
          "ratingCount": 1,
          "averageRating": 5
        }
      };
      // await api.request(
      //     apiString: finalUrl, method: "get", queryParams: {"shopId": shopId});

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
      final response = {
        "state": "SUCCESS",
        "status": 201,
        "data": {
          "acknowledged": true,
          "modifiedCount": 1,
          "upsertedId": null,
          "upsertedCount": 0,
          "matchedCount": 1
        }
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "post",
      //     payload: {"shopId": shopId, "stars": rating, "foodId": foodIds});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<ApiResponse> getPastOrders({String? customerId}) async {
    try {
      final String finalUrl = commonHost.url(StreetNosheryUrls.getPastOrders);
      final response = {
        "state": "SUCCESS",
        "status": 200,
        "data": [
          {
            "_id": "67f3db1e9ce2a84ed79c053c",
            "orderTrackId": "114Pq4NMpEMRW9kX",
            "__v": 0,
            "createdAt": "2025-04-07T14:03:10.901Z",
            "customerId": "STREET_NOSHERY_Q9TQEDQMJZ80H85HANQN",
            "isOrderConfirmed": true,
            "isOrderDelivered": true,
            "isOrderFailed": false,
            "isOrderInProgress": false,
            "isOrderOutForDelivery": false,
            "isOrderPlaced": true,
            "isPaymentDone": true,
            "isorderCancelled": false,
            "orderItems": [
              {
                "dishName": "Paneer Butter Masala",
                "description":
                    "A rich and creamy tomato-based curry with paneer.",
                "price": "250",
                "rating": 4,
                "foodId": 101
              },
              {
                "dishName": "Garlic Naan",
                "description":
                    "Soft Indian bread topped with garlic and butter.",
                "price": "50",
                "rating": 5,
                "foodId": 102
              }
            ],
            "orderPlacedAt": "2025-04-07T14:03:10.900Z",
            "orderStatus": "DELIVERED",
            "paymentAmount": "NaN",
            "paymentStatus": "SUCCESS",
            "shopId": 1,
            "updatedAt": "2025-04-07T14:20:52.765Z",
            "orderConfirmedAt": "2025-04-07T14:16:01.199Z",
            "orderDeliveredAt": "2025-04-07T14:20:52.764Z"
          }
        ]
      };
      // await api.request(
      //     apiString: finalUrl,
      //     method: "get",
      //     queryParams: {"customerId": customerId});

      return ApiResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
