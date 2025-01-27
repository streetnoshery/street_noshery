import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryMobileNumberView
    extends GetView<StreetNosheryOnboardingController> {
  const StreetNosheryMobileNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController =
        Get.isRegistered<StreetNosheryOnboardingController>()
            ? Get.find<StreetNosheryOnboardingController>()
            : Get.put(StreetNosheryOnboardingController());
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SizedBox(
            width: Get.width,
            child: FloatingActionButton(
              onPressed: (onboardingController.isMobileNumberValid())
                  ? () async {
                      final isOtpSent = await controller.sendOTP(context);
                      if(isOtpSent) {
                        Get.toNamed(Routes.mobileVerificationOTPScreen);
                      }
                    }
                  : null,
              backgroundColor: (onboardingController.isMobileNumberValid())
                  ? Colors.black
                  : Colors.grey.shade400,
              child: Text(
                "Continue",
                style: TextStyle(
                    color: (onboardingController.isMobileNumberValid())
                        ? Colors.white
                        : Colors.grey.shade600),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: Image.asset(
                        onboardingController.allImages.streetNosheryLogo,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                    child: Text(
                  "Welcome back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
                const Center(
                    child: Text(
                  "Please enter your details to login.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                )),
                const SizedBox(
                  height: 30,
                ),
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
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (country) {
                          controller.selectedCountryCode.value =
                              country.dialCode ?? "+91";
                        },
                        initialSelection: 'भारत',
                        favorite: const ['+91', 'भारत'],
                        showFlag: true,
                        showFlagDialog: true,
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.phoneController,
                          decoration: InputDecoration(
                              hintText: '(201) 555-0123',
                              border: const OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green.shade800,
                                    width: 2.0), // On focus
                              )),
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
            )),
      );
    });
  }
}
