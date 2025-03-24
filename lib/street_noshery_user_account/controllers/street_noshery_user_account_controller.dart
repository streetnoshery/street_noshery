import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_account_setting_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/street_noshery_user_account/providers/street_noshery_account_provider.dart';

class StreetnosheryUserAccountController extends GetxController {
  RxBool isWhatsAppToggled = false.obs;
  final homeController = Get.find<StreetNosheryHomeController>();
  NotificationSettings get accountSettingFirebaseModel => homeController.onboardingController.fireBaseContentHandler.streetNosheryAccountSettingFirebaseModel;
  final isNotificationUpdated = false.obs;

  Future<void> notification(bool value) async {
    try {
      ApiResponse response = await StreetNosheryUserAccountProviders.enableNotification(customerId: homeController.onboardingController.streetNosheryUserData.value.userName, isEnable: value);
      if(response.data != null) {
        isNotificationUpdated.value = true;
      }
    } catch (e) {
      hideLoader();
      throw e;
    }
  }
}