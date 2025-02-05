import 'package:get/get.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_account_setting_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';

class StreetnosheryUserAccountController extends GetxController {
  RxBool isSMSToggled = false.obs;
  RxBool isWhatsAppToggled = false.obs;
  final homeController = Get.find<StreetNosheryHomeController>();
  NotificationSettings get accountSettingFirebaseModel => homeController.onboardingController.fireBaseContentHandler.streetNosheryAccountSettingFirebaseModel;
}