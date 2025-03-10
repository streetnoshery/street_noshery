import 'package:get/get.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_account_setting_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';
import 'package:street_noshery/street_noshery_user_account/providers/street_noshery_account_provider.dart';

class StreetnosheryUserAccountController extends GetxController {
  RxBool isSMSToggled = false.obs;
  RxBool isWhatsAppToggled = false.obs;
  final homeController = Get.find<StreetNosheryHomeController>();
  NotificationSettings get accountSettingFirebaseModel => homeController.onboardingController.fireBaseContentHandler.streetNosheryAccountSettingFirebaseModel;

  @override
  void onReady() {
    isSMSToggled.value = homeController.onboardingController.streetNosheryUserData.value.isEmailNotificationEnable ?? false;
  }

  Future<void> notification() async {
    try {
      ApiResponse response = await StreetNosheryUserAccountProviders.enableNotification(customerId: homeController.onboardingController.streetNosheryUserData.value.userName, isEnable: isSMSToggled.value);
      if(response.data != null) {
        isSMSToggled.value = StreetNosheryUser.fromJson(response.data).isEmailNotificationEnable ?? false;
        // TODO: Fetch latest user details for enable notifications
      }
    } catch (e) {
      throw e;
    }
  }
}