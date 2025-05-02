import 'package:get/get.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_address.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_shops_firebase_model.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_common_failure_bottomsheet.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/profile/controllers/street_noshery_profile_controller.dart';
import 'package:street_noshery/street_noshery_user_address/providers/street_noshery_user_address_update_provider.dart';

class StreetNosheryUserAddressController extends GetxController {
  RxString selectedAddress = "".obs;
  RxString phoneNumber = "".obs;
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
  final profileController = Get.find<StreetnosheryProfileController>();
  StreetNosheryFirebaseModel get streetNosheryAddressFirebaseModel =>
      onboardingController
          .fireBaseContentHandler.streetNosheryAddressFirebaseModel;
  List<StreetNosheryShopsModelShop> get items => onboardingController
      .fireBaseContentHandler.streetNosheryShopsFirebaseData;
  final firstLine = "".obs;
  final secondLine = "".obs;
  final shopId = 0.obs;
  final isuserAddressUpdated = false.obs;
  StreetNosheryAddressProviders userAddressProvider = StreetNosheryAddressProviders();

  @override
  void onReady() {
    // selectedAddress.value = selectedAddress.value.isNotEmpty ? selectedAddress.value : onboardingController.address.value;
    phoneNumber.value = profileController.contactNumber.value.isNotEmpty
        ? profileController.contactNumber.value
        : onboardingController.contactNumber.value;
  }

  Future<void> updateAddress() async {
    try {
      RepoResponse response = await userAddressProvider.updateAddress(
          firstLine: firstLine.value,
          secondLine: secondLine.value,
          shopId: shopId.value,
          customerId:
              onboardingController.streetNosheryUserData.value.customerId);
      if (response.data != null) {
        isuserAddressUpdated.value = true;
      } else {
        isuserAddressUpdated.value = false;
      }
    } catch (e) {
      hideLoader();
      StreetNosheryCommonBottomSheet.show(
        child: const StreetNosheryCommonErrorBottomsheet(
          errorTitle: "Address Update Failed",
          errorSubtitle:
              "We couldn’t update your address at the moment. Please try again shortly.",
        ),
      );
      rethrow;
    }
  }

  String getUserAddress({String? firstLine, String? secondLine}) {
    return [firstLine, secondLine]
        .where((line) => line != null && line.isNotEmpty)
        .join(", ");
  }
}
