import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_help_static_data.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_home_page_static_data.model.dart';
import 'package:street_noshery/home_page/enums/street_noshery_home_page_enums.dart';
import 'package:street_noshery/home_page/models/favourite_food_model.dart';
import 'package:street_noshery/home_page/models/street_noshery_menu_model.dart';
import 'package:street_noshery/home_page/models/street_noshery_past_orders_model.dart';
import 'package:street_noshery/home_page/providers/street_noshery_home_page_provider.dart';
import 'package:street_noshery/menu/enums/street_noshery_menu_enums.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';
import 'package:street_noshery/orders/models/street_noshery_order_model.dart';
import 'package:street_noshery/orders/providers/street_noshery_order_provider.dart';
import 'package:street_noshery/reviews/model/street_noshery_rating_review.dart';
import 'package:url_launcher/url_launcher.dart';

class StreetNosheryHomeController extends GetxController {
  final RxBool homeState = false.obs;
  final onboardingController = Get.find<StreetNosheryOnboardingController>();

  Rx<StreetNosheryMenu> menu = StreetNosheryMenu().obs;
  final bestSeller = <MenuItem>[].obs;

  List<StreetNosheryPastOrdersModel> recentlyBroughtFoodItems = [];

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

  Rx<StreetNosheryUser> streetNosheryUser = StreetNosheryUser().obs;
  List<StreetNosheryPastOrdersModel> pastOrders = [];

  final isOrderFetched = false.obs;
  RxList orders = [].obs;

  @override
  void onInit() async {
    streetNosheryUser.value = onboardingController.streetNosheryUserData.value;
    if (!(streetNosheryUser.value.isRegisterForShop ?? true)) {
      await getMenu(streetNosheryUser.value.address?.shopId ?? 1);
      await getBestSeller(menu.value);
      await getPastOrders();
      assignPastOrders();
    } else {
      await fetchOrders();
    }
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  void updateCart(String itemName, String? itemPrice, num dishId) {
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
        'price': int.tryParse(itemPrice ?? "0") ?? 0,
        'dishId': dishId
      });
    }

    foodCartList.refresh(); // Notify observers of the update
  }

  void removeFromCart(String itemName, num itemPrice) {
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

  getFirstName(String name) {
    return name.split(" ").first;
  }

  Future<void> getMenu(int shopId) async {
    try {
      ApiResponse response =
          await StreetNosheryHomeProviders.getMenu(shopId: shopId);
      if (response.data != null) {
        menu.value = StreetNosheryMenu.fromJson(response.data);
      }
    } catch (e) {
      throw e;
    }
  }

  getBestSeller(StreetNosheryMenu menu) {
    menu.menu?.sort((a, b) => b.rating?.compareTo(a.rating ?? 0.0) ?? 0);
    bestSeller.value = menu.menu?.take(5).toList() ?? [];
  }

  Future<void> getPastOrders() async {
    try {
      ApiResponse response = await StreetNosheryHomeProviders.getPastOrders(
          customerId: streetNosheryUser.value.customerId);
      if (response.data != null) {
        pastOrders = (response.data as List)
            .map((e) => StreetNosheryPastOrdersModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      throw e;
    }
  }

  void assignPastOrders() {
    recentlyBroughtFoodItems = pastOrders;
  }

  PastOrderDetailsResponse getPastOrderDetails(List<MenuItem> menuList) {
    var response = PastOrderDetailsResponse(title: '', rating: 0, price: "0");
    var price = 0;
    for (var pastOrderMenu in menuList) {
      response.title += (pastOrderMenu.dishName ?? "");
      response.rating += pastOrderMenu.rating?.toInt() ?? 0;
      price += num.tryParse(pastOrderMenu.price.toString())?.toInt() ?? 0;
    }

    if (response.title.length > 20) {
      response.title = '${response.title.substring(0, 20)}...';
    }
    response.rating = (response.rating / menuList.length).toInt();
    response.price = price.toString();
    return response;
  }

  void addAllItemsToCart(List<MenuItem> menuList) {
    for (var menu in menuList) {
      updateCart(menu.dishName ?? "", menu.price, menu.foodId as num);
      updateCartAmount(int.tryParse(menu.price ?? "0") ?? 0, UpdatePrice.add);
    }
  }

  Future<void> fetchOrders() async {
    try {
      ApiResponse response = await StreetNosheryShopOrdersProviders.getOrder(
          shopId: streetNosheryUser.value.address?.shopId);
      if (response.data != null) {
        orders.value = (response.data as List)
            .map((e) => StreetNosheryShopOrders.fromJson(e))
            .toList();
        isOrderFetched.value = true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateOrder(String? orderTrackId, String? status) async {
    try {
      ApiResponse response = await StreetNosheryShopOrdersProviders.updateOrder(
          shopId: streetNosheryUser.value.address?.shopId,
          orderTrackId: orderTrackId,
          customerId: streetNosheryUser.value.customerId,
          status: status);
      if (response.data != null) {
        orders.value = (response.data as List)
            .map((e) => StreetNosheryShopOrders.fromJson(e))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  statusTobeUpdated(String status) {
    switch (status) {
      case 'PLACED':
        return 'CONFIRMED';
      case 'CONFIRMED':
        return 'OUT_FOR_DELIVERY';
      case 'OUT_FOR_DELIVERY':
        return 'DELIVERED';
      case 'DELIVERED':
        return null; // No further status update after delivery
      case 'CANCELLED':
        return "CANCELLED"; // Order is cancelled, no update needed
      default:
        return null; // Handle unknown statuses
    }
  }
}
