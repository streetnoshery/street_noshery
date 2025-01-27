import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/profile/controllers/street_noshery_profile_controller.dart';

class StreetNosheryProfileEditWidget extends GetView<StreetnosheryProfileController> {
  const StreetNosheryProfileEditWidget({super.key});

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
            onPressed: controller.isUserDetailsValid.value ? () {
              Get.back();
            } : null,
            backgroundColor: controller.isUserDetailsValid.value ? Colors.black: Colors.grey.shade400,
            child: Text("Edit", style: TextStyle(color: controller.isUserDetailsValid.value ? Colors.white : Colors.grey.shade500),),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.black),
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
                    child: Image.asset(
                          controller.allImages.streetNosheryLogo,
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill),
                  ),
                  const SizedBox(height: 20,),
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
                                color: Colors.green.shade800, width: 2.0), // On focus
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (name) {
                          controller.userName.value = name;
                        },
                      )),
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Mobile Number",
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
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (country) {
                            controller.selectedCountryCode.value =
                                country.dialCode ?? "+91";
                          },
                          initialSelection: 'US',
                          favorite: const ['+1', 'US'],
                          showFlag: true,
                          showFlagDialog: true,
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.phoneController,
                            decoration: const InputDecoration(
                              hintText: '(201) 555-0123',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            onChanged: (contactNumner) {
                              controller.contactNumber.value = contactNumner;
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
    });
  }
}
