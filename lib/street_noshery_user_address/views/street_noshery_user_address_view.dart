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
    final colors = CommonTheme();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Custom AppBar height
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: colors.lightLeafGreen, // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 1, // Blur radius
              offset: const Offset(0, 4), // Offset in X and Y direction
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                // Back button at the left
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Get.back();
                  },
                ),
                // Help button at the right
                Text(
                  controller.streetNosheryAddressFirebaseModel.title
                          ?.toUpperCase() ??
                      "ADDRESSES",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownSearch<String>(
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
                onSaved: (newValue) async {
                },
                onChanged: (value) async {
                  // Find the corresponding object from the list
                  controller.selectedAddress.value = value ?? "";
                  final items = controller.items;
                  for (var item in items) {
                    String formattedItem =
                        "${item.shopAddress?.addressLine1}, ${item.shopAddress?.addressLine2}";

                    if (value!.contains(formattedItem)) {
                      controller.firstLine.value = item.shopAddress?.addressLine1 ?? "";
                      controller.secondLine.value = item.shopAddress?.addressLine2 ?? "";
                      controller.shopId.value = int.tryParse(item.shopAddress?.shopId ?? "0") ?? 0;
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
                visible: controller.selectedAddress.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                      controller.streetNosheryAddressFirebaseModel.savedAddress
                              ?.title
                              ?.toUpperCase() ??
                          "SAVED ADDRESS",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: controller.selectedAddress.isNotEmpty,
                child: Container(
                  color: Colors.white,
                  width: Get.width,
                  height: Get.height,
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
                        Text("${controller.selectedAddress}",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12)),
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
                                    color: Colors.grey.shade700, fontSize: 12)),
                            Text(controller.phoneNumber.value,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
