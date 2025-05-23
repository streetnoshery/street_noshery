import 'package:get/get.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_response.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_address.model.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_shops_firebase_model.dart';
import 'package:street_noshery/home_page/controllers/home_controller.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_common_failure_bottomsheet.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/onboarding/models/street_noshery_onboarding_user_data_model.dart';
import 'package:street_noshery/street_noshery_user_address/providers/street_noshery_user_address_update_provider.dart';

class StreetNosheryUserAddressController extends GetxController {
  RxString phoneNumber = "".obs;
  final onboardingController = Get.find<StreetNosheryOnboardingController>();
  final streetNosheryHomeController = Get.find<StreetNosheryHomeController>();
  StreetNosheryFirebaseModel get streetNosheryAddressFirebaseModel =>
      onboardingController
          .fireBaseContentHandler.streetNosheryAddressFirebaseModel;
  List<StreetNosheryShopsModelShop> get items => onboardingController
      .fireBaseContentHandler.streetNosheryShopsFirebaseData;
  final firstLine = "".obs;
  final secondLine = "".obs;
  final shopId = 0.obs;
  StreetNosheryAddressProviders userAddressProvider =
      StreetNosheryAddressProviders();
  StreetNosheryUser addressResponse = StreetNosheryUser();

  @override
  void onReady() {
    phoneNumber.value = onboardingController.streetNosheryUserData.value.mobileNumber ?? "";
  }

  Future<bool> updateAddress() async {
    try {
      RepoResponse response = await userAddressProvider.updateAddress(
          firstLine: firstLine.value,
          secondLine: secondLine.value,
          shopId: shopId.value,
          customerId:
              onboardingController.streetNosheryUserData.value.customerId);
      if (response.data != null) {
        addressResponse = response.data;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  String getUserAddress({String? firstLine, String? secondLine}) {
    return [firstLine, secondLine]
        .where((line) => line != null && line.isNotEmpty)
        .join(", ");
  }

  Future<void> updateAddressAndTakeActions() async{
    showLoader();
    final isAddressUpdated = await updateAddress();
    if(isAddressUpdated) {
      if(addressResponse.address?.shopId != null) {
        streetNosheryHomeController.getMenu(addressResponse.address?.shopId ?? 1);
        streetNosheryHomeController.foodCartList.value = [];
        streetNosheryHomeController.totalCartAmount.value = 0;
      }
      hideLoader();
    }
    else{
      hideLoader();
      StreetNosheryCommonBottomSheet.show(
          child: const StreetNosheryCommonErrorBottomsheet(
            errorTitle: "Address Update Failed",
            errorSubtitle:
                "We couldn’t update your address at the moment. Please try again shortly.",
          ),
        );
    }
  }
}
