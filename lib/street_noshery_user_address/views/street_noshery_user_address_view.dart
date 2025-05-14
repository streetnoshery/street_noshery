import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/common/common_theme.dart';
import 'package:street_noshery/street_noshery_user_address/controllers/street_noshery_user_address_controller.dart';

class StreetNosheryUserAddressView
    extends GetView<StreetNosheryUserAddressController> {
  const StreetNosheryUserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = CommonTheme();
    return Scaffold(
      backgroundColor: colorsTheme.theme.pageBackgroundColor,
      appBar: AppBar(
        title: Text(
          controller.streetNosheryAddressFirebaseModel.title ?? "Address",
          style: TextStyle(color: colorsTheme.theme.textPrimary, fontSize: 15),
        ),
        backgroundColor: colorsTheme.theme.lightLeafGreen,
      ),
      body: Obx(() {
        final userAddressLine = controller.getUserAddress(
            firstLine: controller.onboardingController.streetNosheryUserData
                .value.address?.firstLine,
            secondLine: controller.onboardingController.streetNosheryUserData
                .value.address?.secondLine);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSearchBox: true, // Enables the search box
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    labelStyle: TextStyle(
                        color: colorsTheme.theme.textPrimary, fontSize: 15),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              items: controller.items
                  .map((item) =>
                      "${item.shopAddress?.addressLine1}, ${item.shopAddress?.addressLine2}")
                  .toList(), // Convert object to string
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: userAddressLine,
                  labelStyle: TextStyle(
                      color: colorsTheme.theme.textPrimary, fontSize: 15),
                  hintText: "Choose one",
                  border: const OutlineInputBorder(),
                ),
              ),
              onSaved: (newValue) async {},
              onChanged: (value) async {
                // Find the corresponding object from the list
                final items = controller.items;
                for (var item in items) {
                  String formattedItem =
                      "${item.shopAddress?.addressLine1}, ${item.shopAddress?.addressLine2}";
        
                  if (value!.contains(formattedItem)) {
                    controller.firstLine.value =
                        item.shopAddress?.addressLine1 ?? "";
                    controller.secondLine.value =
                        item.shopAddress?.addressLine2 ?? "";
                    controller.shopId.value = item.shopAddress?.shopId ?? 0;
                  }
                }
                showLoader();
                await controller.updateAddress();
                hideLoader();
              },
            ),
            // DropdownSearch<String>(
            //   popupProps: const PopupProps.menu(
            //     showSearchBox: true, // Enables the search box
            //     searchFieldProps: TextFieldProps(
            //       decoration: InputDecoration(
            //         hintText: "Search here...",
            //         border: OutlineInputBorder(),
            //       ),
            //     ),
            //   ),
            //   items: controller.items, // List of items to display
            //   dropdownDecoratorProps: DropDownDecoratorProps(
            //     dropdownSearchDecoration: InputDecoration(
            //       labelText: controller.streetNosheryAddressFirebaseModel.searchAddress ?? "Search the address",
            //       hintText: "Choose one",
            //       border: const OutlineInputBorder(),
            //     ),
            //   ),
            //   onChanged: (value) {
        
            //   },
            // ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: userAddressLine.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                    controller.streetNosheryAddressFirebaseModel.savedAddress
                            ?.title
                            ?.toUpperCase() ??
                        "SAVED ADDRESS",
                    style: TextStyle(
                        color: colorsTheme.theme.textSecondary,
                        fontSize: 15)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: userAddressLine.isNotEmpty,
              child: Container(
                color: Colors.white,
                width: Get.width,
                height: Get.height*.70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //     controller.streetNosheryAddressFirebaseModel
                      //             .savedAddress?.office
                      //             ?.toUpperCase() ??
                      //         "OFFICE",
                      //     style: const TextStyle(
                      //         color: Colors.black54,
                      //         fontSize: 15,
                      //         fontWeight: FontWeight.bold)),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Text(userAddressLine,
                          style: TextStyle(
                              color: colorsTheme.theme.textSecondary,
                              fontSize: 15)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                              controller.streetNosheryAddressFirebaseModel
                                      .savedAddress?.phoneNumber ??
                                  "Phone Number:",
                              style: TextStyle(
                                  color: colorsTheme.theme.greySecondary,
                                  fontSize: 15)),
                          Text(controller.phoneNumber.value,
                              style: TextStyle(
                                  color: colorsTheme.theme.textPrimary,
                                  fontSize: 15))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
