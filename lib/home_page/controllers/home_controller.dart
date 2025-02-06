import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_help_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_home_page_static_data.model.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';
import 'package:street_noshery/home_page/models/favourite_food_model.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class StreetNosheryHomeController extends GetxController {
  final RxBool homeState = false.obs;
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
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
  final boxReview = "".obs;
  final totalPayment = 0.0.obs;
  final deliveryFee = (10.0).obs;
  final platFormFee = (10.0).obs;
  final gst = (10.0).obs;
  final selectedStars = 0.obs;
  final isFavorite = false.obs;
  final tappedFoodId = 0.obs;

  // Firebase static data
  StreetNosheryHomePageFireBaseModel get streetNosheryHomePageFirebaseModel =>
      onboardingController
          .fireBaseContentHandler.streetNosheryHomePageFireBaseModel;
  StreetNosheryHelpAndSupportFirebasemodel
      get streetnosheryHelpAndSupportFirebaseModel => onboardingController
          .fireBaseContentHandler.streetNosheryHelpAndSupportFirebaseModel;

  @override
  void onReady() {}

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
    final colors = CommonTheme();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Review submitted",
          style: TextStyle(color: colors.textPrimary),
        ),
        backgroundColor: colors.lightGreen,
      ),
    );
    boxReviewController.text = "";
    selectedStars.value = 0;
    Get.back();
    /*
    TODO: Review API
     */
  }

  bool shouldReviewButtonEnable(String? review) {
    if ((review?.isNotEmpty ?? false) && selectedStars.value > 0) {
      return true;
    }
    return false;
  }

  void updateTotalPayment() {
    totalPayment.value = totalCartAmount.value +
        deliveryFee.value +
        platFormFee.value +
        gst.value;
  }

  void increaseStarCount(int index) {
    selectedStars.value = index + 1;
  }

  Future<void> updateFavoriteFood() async {
    // TODO: update favorite food API
  }

  void sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    try {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print("Error launching email: $e");
    }
  }
}
