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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SizedBox(
            width: Get.width,
            child: FloatingActionButton(
              onPressed: controller.isUserDetailsValid.value
                  ? () async {
                    showLoader(context);
                    await controller.saveuserDetails();
                    hideLoader(context);
                    Get.toNamed(Routes.home);
                    }
                  : null,
              backgroundColor: controller.isUserDetailsValid.value
                  ? Colors.black
                  : Colors.grey.shade400,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: IconButton(
                    padding: const EdgeInsets.only(top: 30),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black,
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
                              color: Colors.green.shade800,
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Address",
                    style: TextStyle(
                        color: Colors.black,
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
                        controller.address.value = StreetNosheryShopAddress(
                          firstLine: selectedAddress.shopAddress?.addressLine1,
                          secondLine: selectedAddress.shopAddress?.addressLine2,
                          shopId: int.parse(selectedAddress.shopAddress?.shopId ?? "0"),
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
