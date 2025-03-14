import 'package:street_noshery/common/common_api.dart';
import 'package:street_noshery/common/common_response.dart';

final api = API();

class StreetNosheryAddressProviders {
  static Future<ApiResponse> updateAddress(
    {
      String? firstLine,
      String? secondLine,
      num? shopId,
      String? customerId
    }
  ) async {
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
    //     payload: {
    //       firstLine,
    //       secondLine,
    //       shopId,
    //       customerId
    //     });

    return ApiResponse.fromJson(response);
  }
}
