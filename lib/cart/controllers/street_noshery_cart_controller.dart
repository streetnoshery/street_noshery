import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_cart_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/menu/controller/street_noshery_menu_controller.dart';
import 'package:street_noshery/orders/providers/street_noshery_order_provider.dart';

class StreetNosheryCartController extends GetxController {
  final homeController = Get.find<StreetNosheryHomeController>();
  final menuController = Get.isRegistered<StreetNosheryMenuController>()
      ? Get.find<StreetNosheryMenuController>()
      : Get.put(StreetNosheryMenuController());
  List serviceType = [
    {1: "take Away"},
    {2: "book Table"},
    {3: "Schedule"}
  ];
  final serviceOption = 1.obs;
  final allImages = CommonImages();
  final selectedDate = "".obs;
  final selectedTime = "".obs;
  StreetNosheryCartFirebaseStaticDataModel get streetNosheryFirebasemodel =>
      homeController.onboardingController.fireBaseContentHandler
          .streetNosheryCartFirebaseModel;
  final Razorpay _razorpay = Razorpay();

  var options = {
    'key': 'rzp_test_7RoefomgUxd2EJ',
    'amount': 5,
    'currency': "INR",
    'name': 'Acme Corp.',
    'description': 'Fine T-Shirt',
    'prefill': {'contact': '8107748619', 'email': 'sumitgod510@gmail.com'}
  };

  @override
  void onInit() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void onReady() {
    serviceType = [
      {1: streetNosheryFirebasemodel.serviceChoice?[0] ?? "take Away"},
      {2: streetNosheryFirebasemodel.serviceChoice?[1] ?? "book Table"},
      {3: streetNosheryFirebasemodel.serviceChoice?[2] ?? "Schedule"}
    ];
  }

  Future<void> selectDate(BuildContext context) async {
    final colors = CommonTheme();
    DateFormat format = DateFormat("dd-MM-yyyy");
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value.isNotEmpty
          ? format.parse(selectedDate.value)
          : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: colors.darkLeafGreen, // Header background color
            colorScheme: ColorScheme.light(
                primary: colors.darkLeafGreen), // Header text color
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      selectedDate.value =
          DateFormat("dd-MM-yyyy").format(pickedDate).toString();
    }
    update();
  }

  Future<void> selectTime(BuildContext context) async {
    final colors = CommonTheme();
    List<String> timeParts =
        selectedTime.split(':'); // Split string into hours and minutes
    int hour = 0;
    int minute = 0;
    if (selectedTime.value.isNotEmpty) {
      hour = int.parse(timeParts[0]); // Parse hours
      minute = int.parse(timeParts[1]); // Parse minutes
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value.isNotEmpty
          ? TimeOfDay(hour: hour, minute: minute)
          : TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: colors.darkLeafGreen, // Header background color
            colorScheme: ColorScheme.light(
                primary: colors.darkLeafGreen), // Header text color
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      selectedTime.value =
          '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
    }
    update();
  }

  Future<void> placeOrder() async {
    try{
      ApiResponse response = await StreetNosheryShopOrdersProviders.orderFT();
      if(response.data != null) {
        
      }
    }catch(error) {
      rethrow;
    }
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("razorpay payment success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("razorpay payment failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
