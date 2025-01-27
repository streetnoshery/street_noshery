import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';
import 'package:street_noshery/home_page/models/favourite_food_model.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';

class StreetNosheryHomeController extends GetxController {
  final RxBool homeState = false.obs;
  List<FavouriteFood> bestSeller = [
    FavouriteFood(
        image: "assets/home/street_noshery_dark_green_logo.png",
        itemName: "Dish Name",
        price: 20,
        rating: 4.5,
        dishId: 1),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 20,
      rating: 4,
      dishId: 2,
    ),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 2,
      rating: 5,
      dishId: 3,
    ),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 20,
      rating: 4.5,
      dishId: 4,
    ),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 20,
      rating: 3.8,
      dishId: 5,
    ),
  ];

  List<FavouriteFood> recentlyBroughtFoodItems = [
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 20,
      rating: 4.5,
      dishId: 1,
      dateTime: "01-02-2025",
    ),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 20,
      rating: 4,
      dishId: 2,
      dateTime: "01-02-2025",
    ),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 2,
      rating: 5,
      dishId: 3,
      dateTime: "01-02-2025",
    ),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 20,
      rating: 4.5,
      dishId: 4,
      dateTime: "01-02-2025",
    ),
    FavouriteFood(
      image: "assets/home/street_noshery_dark_green_logo.png",
      itemName: "Dish Name",
      price: 20,
      rating: 3.8,
      dishId: 5,
      dateTime: "01-02-2025",
    ),
  ];

  final allImages = CommonImages();
  RxString username = "Sumit".obs;
  RxInt sale = 0.obs;
  final selectedTab = TabEnum.home.obs;

  RxList<Map<String, Object>> foodCartList = <Map<String, Object>>[].obs;
  RxNum totalCartAmount = RxNum(0);
  TextEditingController boxReviewController = TextEditingController();
  final totalPayment = 0.0.obs;
  final deliveryFee = (10.0).obs;
  final platFormFee = (10.0).obs;
  final gst = (10.0).obs;

  void updateCart(Object itemName, num itemPrice, num dishId) {
    // Check if the item exists in the cart
    var existingItem = foodCartList.firstWhere(
      (cartItem) => cartItem['itemName'] == itemName,
      orElse: () => {}, // Return null if not found
    );

    if (existingItem.isNotEmpty) {
      // If the item exists, increase the quantity
      int currentCount = existingItem['count'] as int? ?? 0;
      existingItem['count'] = currentCount + 1;
    } else {
      // If the item does not exist, add it with a count of 1
      foodCartList.add({
        'itemName': itemName,
        'count': 1,
        'price': itemPrice,
        'dishId': dishId
      });
    }

    foodCartList.refresh(); // Notify observers of the update
  }

  void removeFromCart(Object itemName, num itemPrice) {
    var existingItem = foodCartList.firstWhere(
      (cartItem) => cartItem['itemName'] == itemName,
      orElse: () => {},
    );

    if (existingItem.isNotEmpty) {
      // Reduce the quantity if the item exists
      int currentCount = existingItem['count'] as int? ?? 0;

      if (currentCount > 1) {
        existingItem['count'] = currentCount - 1;
      } else {
        // If the count becomes 0 or less, remove the item
        foodCartList.remove(existingItem);
      }
    }

    foodCartList.refresh();
  }

  void updateCartAmount(int itemPrice, UpdatePrice type) {
    switch (type) {
      case UpdatePrice.add:
        totalCartAmount.value += itemPrice;
        updateTotalPayment();
        break;
      case UpdatePrice.removed:
        totalCartAmount.value -= itemPrice;
        updateTotalPayment();
    }
  }

  Future<void> submitReviews(String? review, BuildContext context) async {
    if (review?.isNotEmpty ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Review submitted",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.teal.shade200,
        ),
      );
      boxReviewController.text = "";
      Get.back();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          "Please write a review.",
          style: TextStyle(color: Colors.white),
        )),
      );
    }

    /*
    TODO: Review API
     */
  }

  void updateTotalPayment() {
    totalPayment.value = totalCartAmount.value + deliveryFee.value + platFormFee.value + gst.value;
  }
}
