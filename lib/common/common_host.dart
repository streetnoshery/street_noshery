class StreetNosheryCommonHost {
  static const String _baseUrl = "http://15.206.99.178:3000/";
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
  static const String createOrder = "order/create/ft";
  static const String updateOrder = "order/update";
  static const String updateAddress = "customer/update-address";
  static const String createReview = "review/create";
  static const String getReview = "review";
}