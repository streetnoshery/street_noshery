import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();

class StreetNosheryHomeProviders {
  static Future<ApiResponse> getMenu({int? shopId}) async {
    final response = {
      "state": "SUCCESS",
      "status": 200,
      "data": {
        "_id": "67b1d6d6aae1dc9d6cb11226",
        "shopId": 1,
        "createdAt": "2025-02-16T12:15:18.243Z",
        "menu": [
          {
            "dishName": "Paneer",
            "image": "assets/home/street_noshery_dark_green_logo.png",
            "description": "Creamy tomato-based curry with paneer",
            "price": "250",
            "rating": 4.8,
            "category": "food",
            "dishId": 1
          },
          {
            "dishName": "Paneer Masala",
            "image": "assets/home/street_noshery_dark_green_logo.png",
            "description": "Creamy tomato-based curry with paneer",
            "price": "250",
            "rating": 4.5,
            "category": "breakfast",
            "dishId": 2
          },
          {
            "dishName": "Paneer Masala",
            "image": "assets/home/street_noshery_dark_green_logo.png",
            "description": "Creamy tomato-based curry with paneer",
            "price": "250",
            "rating": 4.5,
            "category": "liquid",
            "dishId": 3
          }
        ],
        "updatedAt": "2025-02-16T12:16:46.984Z"
      }
    };
    // await api.request(
    //     apiUri: Uri.parse("https://www.example.com/index.html"),
    //     method: "get",
    //     queryParams: {
    //       "shopId": shopId
    //     }
    //     );

    return ApiResponse.fromJson(response);
  }

  static Future<ApiResponse> getReviews({int? shopId}) async {
    final response = {
      "state": "SUCCESS",
      "status": 200,
      "data": {
        "shopId": 3,
        "totalRating": 5,
        "ratingCount": 1,
        "averageRating": 5
      }
    };

    // await api.request(
    //     apiUri: Uri.parse("https://www.example.com/index.html"),
    //     method: "get",
    //     queryParams: {"shopId": shopId});

    return ApiResponse.fromJson(response);
  }

  static Future<ApiResponse> getPastOrders({String? customerId}) async {
    final response = {
      "state": "SUCCESS",
      "status": 200,
      "data": [
        {
          "_id": "67be0757aae1dc9d6cb18c02",
          "orderTrackId": "C8sshQFmgkiFxIWM",
          "__v": 0,
          "createdAt": "2025-02-25T18:09:27.342Z",
          "customerId": "cust_12345",
          "isOrderConfirmed": false,
          "isOrderDelivered": true,
          "isOrderInProgress": false,
          "isOrderOutForDelivery": false,
          "isOrderPlaced": true,
          "isPaymentDone": false,
          "isorderCancelled": false,
          "orderItems": [
            {
              "dishName": "Paneer Butter Masala",
              "description":
                  "Delicious paneer cooked in a rich buttery tomato gravy.",
              "price": "250",
              "rating": 4.5,
              "foodId": 101,
              "dishId": 1,
              "image": "assets/home/street_noshery_dark_green_logo.png",
            },
            {
              "dishName": "Veg Biryani",
              "description":
                  "Aromatic basmati rice cooked with fresh vegetables and spices.",
              "price": "200",
              "rating": 4.7,
              "foodId": 102,
              "dishId": 2,
              "image": "assets/home/street_noshery_dark_green_logo.png"
            }
          ],
          "orderPlacedAt": "2025-02-25T18:09:27.340Z",
          "orderStatus": "DELIVERED",
          "paymentStatus": "INITIATED",
          "shopId": "shop_67890",
          "updatedAt": "2025-02-25T18:14:11.891Z",
          "orderDeliveredAt": "2025-02-25T18:14:11.890Z"
        },
        {
          "_id": "67d58d9037cd7d089f53556d",
          "orderTrackId": "C8sshQFmgkiFxIWW",
          "__v": 0,
          "createdAt": "2025-02-25T18:09:27.342Z",
          "customerId": "cust_12345",
          "isOrderConfirmed": false,
          "isOrderDelivered": true,
          "isOrderInProgress": false,
          "isOrderOutForDelivery": false,
          "isOrderPlaced": true,
          "isPaymentDone": false,
          "isorderCancelled": false,
          "orderItems": [
            {
              "dishName": "Paneer Butter Masala",
              "description":
                  "Delicious paneer cooked in a rich buttery tomato gravy.",
              "price": "250",
              "rating": 4.5,
              "foodId": 101,
              "dishId": 1
            },
            {
              "dishName": "Veg Biryani",
              "description":
                  "Aromatic basmati rice cooked with fresh vegetables and spices.",
              "price": "200",
              "rating": 4.7,
              "foodId": 102,
              "dishId": 2
            }
          ],
          "orderPlacedAt": "2025-02-25T18:09:27.340Z",
          "orderStatus": "DELIVERED",
          "paymentStatus": "INITIATED",
          "shopId": "shop_67890",
          "updatedAt": "2025-02-25T18:14:11.891Z",
          "orderDeliveredAt": "2025-02-25T18:14:11.890Z"
        }
      ]
    };

    // await api.request(
    //     apiUri: Uri.parse("https://www.example.com/index.html"),
    //     method: "get",
    //     queryParams: {"customerId": customerId});

    return ApiResponse.fromJson(response);
  }
}
