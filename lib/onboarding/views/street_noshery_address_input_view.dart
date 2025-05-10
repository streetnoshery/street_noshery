import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/firebase/firebase_model/street_noshery_shops_firebase_model.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/onboarding/models/street_noshery_create_user_data_model.dart';
import 'package:street_noshery/routes/app_pages.dart';

class OnboardingUserDetails extends GetView<StreetNosheryOnboardingController> {
  const OnboardingUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.isValidDetails();
      return Scaffold(
        backgroundColor: controller.theme.theme.pageBackgroundColor,
        appBar: AppBar(
          backgroundColor: controller.theme.theme.pageBackgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: SizedBox(
            width: Get.width,
            child: FloatingActionButton(
              onPressed: controller.isUserDetailsValid.value
                  ? () async {
                    showLoader();
                    await controller.saveuserDetails();
                    hideLoader();
                    Get.toNamed(Routes.home);
                    }
                  : null,
              backgroundColor: controller.isUserDetailsValid.value
                  ? Colors.black
                  : Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30), // <-- adds round borders
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                    color: controller.isUserDetailsValid.value
                        ? Colors.white
                        : Colors.grey.shade500),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(controller.allImages.streetNosheryLogo,
                      height: 80, width: 80, fit: BoxFit.fill),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: controller.theme.theme.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: controller.nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: controller.theme.theme.textGreen,
                              width: 2.0), // On focus
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (name) {
                        controller.userName.value = name;
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Address",
                    style: TextStyle(
                        color: controller.theme.theme.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownSearch<String>(
                    popupProps: const PopupProps.menu(
                      showSearchBox: true, // Enables the search box
                      searchFieldProps: TextFieldProps(
                        decoration: InputDecoration(
                          hintText: "Search here...",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    items: controller.items
                        .map((item) =>
                            "${item.shopAddress?.addressLine1}, ${item.shopAddress?.addressLine2}")
                        .toList(), // Convert object to string
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Search the address",
                        hintText: "Choose one",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    onChanged: (value) {
                      // Find the corresponding object from the list
                      var selectedAddress = controller.items.firstWhere(
                        (item) =>
                            "${item.shopAddress?.addressLine1}, ${item.shopAddress?.addressLine2}" ==
                            value,
                        orElse: () => StreetNosheryShopsModelShop(),
                      );

                      if (selectedAddress.shopAddress != null) {
                        controller.address.value = StreetNosheryCreateuserDatamodel(
                          firstLine: selectedAddress.shopAddress?.addressLine1,
                          secondLine: selectedAddress.shopAddress?.addressLine2,
                          shopId: selectedAddress.shopAddress?.shopId.toString(),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
