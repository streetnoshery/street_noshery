import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:street_noshery/cart/model/street_noshery_create_order_model.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/common/common_images.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_cart_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_common_failure_bottomsheet.dart';
import 'package:street_noshery/menu/controller/street_noshery_menu_controller.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/orders/models/street_noshery_order_payload_model.dart';
import 'package:street_noshery/orders/providers/street_noshery_order_provider.dart';

class StreetNosheryCartController extends GetxController {
  final homeController = Get.find<StreetNosheryHomeController>();
  final menuController = Get.isRegistered<StreetNosheryMenuController>()
      ? Get.find<StreetNosheryMenuController>()
      : Get.put(StreetNosheryMenuController());
  List serviceType = [
    {1: "take Away"},
    {2: "book Table"}
  ];
  final serviceOption = 1.obs;
  final allImages = CommonImages();
  final selectedDate = "".obs;
  final selectedTime = "".obs;
  StreetNosheryCartFirebaseStaticDataModel get streetNosheryFirebasemodel =>
      homeController.onboardingController.fireBaseContentHandler
          .streetNosheryCartFirebaseModel;
  late Razorpay _razorpay;
  Rx<OrderData> orderData = OrderData().obs;
  final isOrderCreated = false.obs;
  final paymentId = "".obs;
  final orderId = "".obs;
  StreetNosheryShopOrdersProviders streetNosheryShopOrderProvider =
      StreetNosheryShopOrdersProviders();
  final onboardingControlelr = Get.find<StreetNosheryOnboardingController>();

  @override
  void onInit() {
    _razorpay = Razorpay();
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
      // {3: streetNosheryFirebasemodel.serviceChoice?[2] ?? "Schedule"}
    ];
  }

  Future<void> selectDate(BuildContext context) async {
    final colorsTheme = CommonTheme();
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
            primaryColor:
                colorsTheme.theme.darkLeafGreen, // Header background color
            colorScheme: ColorScheme.light(
                primary: colorsTheme.theme.darkLeafGreen), // Header text color
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
    final colorsTheme = CommonTheme();
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
            primaryColor:
                colorsTheme.theme.darkLeafGreen, // Header background color
            colorScheme: ColorScheme.light(
                primary: colorsTheme.theme.darkLeafGreen), // Header text color
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

  void placeOrder() async {
    try {
      var options = {
        'key': 'rzp_test_N2WixccVgkgsVG',
        'amount': (homeController.totalPayment.value * 100),
        'currency': "INR",
        'name': 'Street Noshery',
        'description': 'Inventory payment',
        'prefill': {'contact': '8107748619', 'email': 'sumitgod510@gmail.com'}
      };
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> createFT() async {
    try {
      final orderPayload = getOrderPayload();
      RepoResponse response =
          await streetNosheryShopOrderProvider.orderFT(payload: orderPayload);
      if (response.data != null) {
        orderData.value = response.data;
      }
    } catch (error) {
      hideLoader();
      rethrow;
    }
  }

  CustomerOrderModel getOrderPayload() {
    return CustomerOrderModel(
        customerId:
            onboardingControlelr.streetNosheryUserData.value.customerId ?? "",
        shopId:
            onboardingControlelr.streetNosheryUserData.value.address?.shopId ??
                1,
        orderItems: homeController.foodCartList,
        amount: homeController.totalPayment.value);
  }

  Future<void> createOrder() async {
    try {
      showLoader();
      RepoResponse response = await streetNosheryShopOrderProvider.createOrder(
          orderTrackId: orderData.value.orderTrackId,
          customerId:
              onboardingControlelr.streetNosheryUserData.value.customerId ?? "",
          shopId: onboardingControlelr
                  .streetNosheryUserData.value.address?.shopId ??
              1,
          paymentId: paymentId.value,
          razorpayOrderId: orderId.value);
      if (response.data != null) {
        orderData.value = response.data;
        isOrderCreated.value = true;
      }
      hideLoader();
    } catch (error) {
      hideLoader();
      rethrow;
    }
  }

  Future<void> updateFailedOrder() async {
    try {
      showLoader();
      RepoResponse response = await streetNosheryShopOrderProvider.updateOrder(
          orderTrackId: orderData.value.orderTrackId!,
          customerId:
              onboardingControlelr.streetNosheryUserData.value.customerId,
          status: "FAILED",
          shopId:
              onboardingControlelr.streetNosheryUserData.value.address?.shopId);
      if (response.data != null) {
        orderData.value = response.data;
      }
      hideLoader();
    } catch (e) {
      hideLoader();
      StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "Payment Failed",
          errorSubtitle:
              "Your payment couldn’t be processed. Please check your details or try another method.",
        ),
      );
      rethrow;
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    paymentId.value = response.paymentId ?? "";
    orderId.value = response.orderId ?? "";
    await createOrder();
    homeController.switchToHome();
    await homeController.getPastOrders();
    homeController.assignPastOrders();
    homeController.foodCartList.value = [];
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    // Do something when payment fails
    await updateFailedOrder();
    StreetNosheryCommonBottomSheet.show(
      child: const StreetNosheryCommonErrorBottomsheet(
        errorTitle: "Payment Failed",
        errorSubtitle:
            "Your payment couldn’t be processed. Please check your details or try another method.",
      ),
    );
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
