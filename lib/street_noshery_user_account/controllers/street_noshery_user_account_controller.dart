import 'package:get/get.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_account_setting_static_data.model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_common_failure_bottomsheet.dart';
import 'package:street_noshery/street_noshery_user_account/providers/street_noshery_account_provider.dart';

class StreetnosheryUserAccountController extends GetxController {
  RxBool isWhatsAppToggled = false.obs;
  final homeController = Get.find<StreetNosheryHomeController>();
  NotificationSettings get accountSettingFirebaseModel => homeController.onboardingController.fireBaseContentHandler.streetNosheryAccountSettingFirebaseModel;
  final isNotificationUpdated = false.obs;
  StreetNosheryUserAccountProviders userAccountProvider = StreetNosheryUserAccountProviders();

  @override
  void onInit() {
    isNotificationUpdated.value = homeController.onboardingController.streetNosheryUserData.value.isEmailNotificationEnable ?? true;
    super.onInit();
  }
  Future<void> notification(bool value) async {
    try {
      RepoResponse response = await userAccountProvider.enableNotification(customerId: homeController.onboardingController.streetNosheryUserData.value.customerId, isEnable: value);
      if(response.data != null) {
        isNotificationUpdated.value = !isNotificationUpdated.value;
      }
      else{
        hideLoader();
        StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "Something Went Wrong",
          errorSubtitle:
              "We're experiencing some issues at the moment. Please try again later.",
        ),
      );
      }
    } catch (e) {
      hideLoader();
      StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "Something Went Wrong",
          errorSubtitle:
              "We're experiencing some issues at the moment. Please try again later.",
        ),
      );
      rethrow;
    }
  }
}