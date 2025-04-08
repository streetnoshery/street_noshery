import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_menu_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';
import 'package:street_noshery/home_page/models/street_noshery_past_orders_model.dart';
import 'package:street_noshery/home_page/providers/street_noshery_home_page_provider.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';
import 'package:street_noshery/reviews/model/street_noshery_rating_review.dart';

class StreetNosheryMenuController extends GetxController {
  final allImages = CommonImages();

  List<MenuItem> food = [
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name",
        price: "20",
        rating: 4.5,
        foodId: 1),
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name",
        price: "20",
        rating: 4.5,
        foodId: 1),
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name",
        price: "20",
        rating: 4.5,
        foodId: 1),
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name",
        price: "20",
        rating: 4.5,
        foodId: 1)
  ];

  List<MenuItem> drinkS = [
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name 1",
        price: "20",
        rating: 4.5,
        foodId: 1),
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name 2",
        price: "20",
        rating: 4.5,
        foodId: 1),
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name 3",
        price: "20",
        rating: 4.5,
        foodId: 1),
  ];

  List<MenuItem> breakfast = [
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name 1",
        price: "20",
        rating: 4.5,
        foodId: 1),
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name 2",
        price: "20",
        rating: 4.5,
        foodId: 1),
    MenuItem(
        image: "assets/home/street_noshery_dark_green_logo.png",
        dishName: "Dish Name 3",
        price: "20",
        rating: 4.5,
        foodId: 1),
  ];

  RxList<StreetNosheryPastOrdersModel> menuList = <StreetNosheryPastOrdersModel>[].obs;
  Rx<Menu> selectedFood = Menu.drinkS.obs;
  final homeController = Get.find<StreetNosheryHomeController>();
  final isFooditemSelected = false.obs;
  final isDrinksSelected = false.obs;
  final isBreakfastSelected = false.obs;
  List<MenuItem> tempFoodArray = <MenuItem>[].obs;
  List<MenuItem> tempDrinks = <MenuItem>[].obs;
  List<MenuItem> tempBreakfast = <MenuItem>[].obs;
  StreetNosheryMenuFirebaseModel get streetNosheryMenuFirebaseStaticModel => homeController.onboardingController.fireBaseContentHandler.streetNosheryMenuFireBasemodel;
  StreetNosheryShopRating ratings = StreetNosheryShopRating();

  @override
  void onReady() async {
    // TODO: Screen shimer loader
    await reviews();
    menuList.assignAll(homeController.recentlyBroughtFoodItems);
    tempFoodArray.assignAll(food);
    tempDrinks.assignAll(drinkS);
    tempBreakfast.assignAll(breakfast);
    getBreakfast(homeController.menu.value);
    getFood(homeController.menu.value);
    getDrinks(homeController.menu.value);
    super.onReady();
  }

  void increaseFoodItemsNumber(num? dishId) {
    for (var dish in tempFoodArray) {
      if (dish.foodId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) + 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void removeFoodItemsNumber(num? dishId) {
    for (var dish in tempFoodArray) {
      if (dish.foodId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) - 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void increaseDrinkItemsNumber(num? dishId) {
    for (var dish in tempDrinks) {
      if (dish.foodId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) + 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void removeDrinkItemsNumber(num? dishId) {
    for (var dish in tempDrinks) {
      if (dish.foodId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) - 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void increasebreakFastItemsNumber(num? dishId) {
    for (var dish in tempBreakfast) {
      if (dish.foodId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) + 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void removeBreakfastItemsNumber(num? dishId) {
    for (var dish in tempBreakfast) {
      if (dish.foodId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) - 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void updateItems(num? dishId) {
    increaseFoodItemsNumber(dishId);
    increaseDrinkItemsNumber(dishId);
    increasebreakFastItemsNumber(dishId);
  }

  void removeditems(num? dishId) {
    removeFoodItemsNumber(dishId);
    removeDrinkItemsNumber(dishId);
    removeBreakfastItemsNumber(dishId);
  }

  getBreakfast(StreetNosheryMenu menu) {
    tempBreakfast = menu.menu?.where((item) => item.category == "breakfast").toList() ?? [];
  }

  getFood(StreetNosheryMenu menu) {
    tempFoodArray = menu.menu?.where((item) => item.category == "food").toList() ?? [];
  }

  getDrinks(StreetNosheryMenu menu){
    tempDrinks = menu.menu?.where((item) => item.category == "liquid").toList() ?? [];
  }

  Future<void> reviews() async {
    try {
      ApiResponse response = await StreetNosheryHomeProviders.getReviews(
          shopId: homeController.streetNosheryUser.value.address?.shopId);
      if (response.data != null) {
        ratings = StreetNosheryShopRating.fromJson(response.data);
      }
    } catch (e) {
      throw e;
    }
  }
}
