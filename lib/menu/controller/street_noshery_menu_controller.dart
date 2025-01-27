import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/models/favourite_food_model.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';

class StreetNosheryMenuController extends GetxController {
  final allImages = CommonImages();

  List<FavouriteFood> food = [
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
        rating: 4.5,
        dishId: 1),
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
        rating: 4.5,
        dishId: 1)
  ];

  List<FavouriteFood> drinkS = [
    FavouriteFood(
        image: "assets/home/street_noshery_dark_green_logo.png",
        itemName: "Dish Name 1",
        price: 20,
        rating: 4.5,
        dishId: 1),
    FavouriteFood(
        image: "assets/home/street_noshery_dark_green_logo.png",
        itemName: "Dish Name 2",
        price: 20,
        rating: 4.5,
        dishId: 1),
    FavouriteFood(
        image: "assets/home/street_noshery_dark_green_logo.png",
        itemName: "Dish Name 3",
        price: 20,
        rating: 4.5,
        dishId: 1),
  ];

  List<FavouriteFood> breakfast = [
    FavouriteFood(
        image: "assets/home/street_noshery_dark_green_logo.png",
        itemName: "Dish Name 1",
        price: 20,
        rating: 4.5,
        dishId: 1),
    FavouriteFood(
        image: "assets/home/street_noshery_dark_green_logo.png",
        itemName: "Dish Name 2",
        price: 20,
        rating: 4.5,
        dishId: 1),
    FavouriteFood(
        image: "assets/home/street_noshery_dark_green_logo.png",
        itemName: "Dish Name 3",
        price: 20,
        rating: 4.5,
        dishId: 1),
  ];

  RxList<FavouriteFood> menuList = <FavouriteFood>[].obs;
  Rx<Menu> selectedFood = Menu.drinkS.obs;
  final homeController = Get.find<StreetNosheryHomeController>();
  final isFooditemSelected = false.obs;
  final isDrinksSelected = false.obs;
  final isBreakfastSelected = false.obs;
  final tempFoodArray = <FavouriteFood>[].obs;
  final tempDrinks = <FavouriteFood>[].obs;
  final tempBreakfast = <FavouriteFood>[].obs;

  @override
  void onReady() {
    menuList.assignAll(homeController.recentlyBroughtFoodItems);
    tempFoodArray.assignAll(food);
    tempDrinks.assignAll(drinkS);
    tempBreakfast.assignAll(breakfast);
    super.onReady();
  }

  void increaseFoodItemsNumber(num? dishId) {
    for (var dish in tempFoodArray) {
      if (dish.dishId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) + 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void removeFoodItemsNumber(num? dishId) {
    for (var dish in tempFoodArray) {
      if (dish.dishId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) - 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void increaseDrinkItemsNumber(num? dishId) {
    for (var dish in tempDrinks) {
      if (dish.dishId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) + 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void removeDrinkItemsNumber(num? dishId) {
    for (var dish in tempDrinks) {
      if (dish.dishId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) - 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void increasebreakFastItemsNumber(num? dishId) {
    for (var dish in tempBreakfast) {
      if (dish.dishId == dishId) {
        dish.dishCount = (dish.dishCount ?? 0) + 1; // Increase the dishCount
        break; // Exit loop once the match is found
      }
    }
  }

  void removeBreakfastItemsNumber(num? dishId) {
    for (var dish in tempBreakfast) {
      if (dish.dishId == dishId) {
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
}
