import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/street_noshery_user_address/controllers/street_noshery_user_address_controller.dart';

class StreetNosheryUserAddressView
    extends GetView<StreetNosheryUserAddressController> {
  const StreetNosheryUserAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Custom AppBar height
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.teal.shade200, // Shadow color
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
                const Text(
                  "ADDRESSES",
                  style: TextStyle(color: Colors.black),
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
                items: controller.items, // List of items to display
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Search the address",
                    hintText: "Choose one",
                    border: OutlineInputBorder(),
                  ),
                ),
                onChanged: (value) {
                  controller.selectedAddress.value = value ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: controller.selectedAddress.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("SAVED ADDRESS",
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("OFFICE",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("${controller.selectedAddress}",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Phone Number: ${controller.phoneNumber.value}",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12))
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
