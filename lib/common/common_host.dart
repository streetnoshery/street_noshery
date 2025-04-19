class StreetNosheryCommonHost {
  static const String _baseUrl = "http://43.204.81.5:3000/";
  static const String _prefix = "street-noshery/";

  final StreetNosheryUrls urls = StreetNosheryUrls();

  String url(String endpoint) {
    return "$_baseUrl$_prefix$endpoint";
  }
}

class StreetNosheryUrls {
  static const String generateOtp = "customer/generate-otp";
  static const String verifyOtp = "customer/verify-otp";
  static const String createUser = "customer/create";
  static const String getUser = "customer";
  static const String enableNotification = "customer/enable-notification";
  static const String getMenu = "menu";
  static const String getPastOrders = "order";
  static const String createOrderFT = "order/create/ft";
  static const String createOrder = "order/create";
  static const String updateOrder = "order/update";
  static const String getShopOrders = "order/order-by-shopId";
  static const String updateAddress = "customer/update-address";
  static const String createReview = "review/create";
  static const String getReview = "review";
  static const String updateFoodReview = "review/create-food-review";
  static const String orderStatus = "order/status";
}