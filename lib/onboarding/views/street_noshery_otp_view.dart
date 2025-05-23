import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_bottomsheet.dart';
import 'package:street_noshery/home_page/widgets/street_noshery_common_failure_bottomsheet.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';

class StreetNosheryMobileVerificationView
    extends GetView<StreetNosheryOnboardingController> {
  const StreetNosheryMobileVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.theme.theme.pageBackgroundColor,
        appBar: AppBar(
          backgroundColor: controller.theme.theme.pageBackgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              controller.resetMobileNumber(); // Reset after sendOTP
              Get.back();
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: SizedBox(
            width: Get.width,
            child: FloatingActionButton(
              onPressed: (controller.otp.value.length == 6)
                  ? () async {
                      await controller.validateOtpAndSaveDetails();
                    }
                  : null,
              backgroundColor: (controller.otp.value.length == 6)
                  ? Colors.black
                  : Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30), // <-- adds round borders
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                    color: (controller.otp.value.length == 6)
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
                    "Otp",
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
                      controller: controller.otpController,
                      decoration: InputDecoration(
                        labelText: 'Otp',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: controller.theme.theme.textGreen,
                              width: 2.0), // On focus
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (otp) {
                        controller.otp.value = otp;
                      },
                    )),
                if (!controller.showResendButton.value)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Text(
                      'Waiting for OTP... ${controller.countdown.value} seconds remaining',
                      style: TextStyle(
                          color: controller.theme.theme.textSecondary,
                          fontSize: 15),
                    ),
                  ),
                if (controller.showResendButton.value)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      onPressed: () async {
                        final isOtpSent = await controller.sendOTP(context);
                        if (!isOtpSent) {
                          StreetNosheryCommonBottomSheet.show(
                              child: const StreetNosheryCommonErrorBottomsheet(
                            errorTitle: "OTP Generation Failed",
                            errorSubtitle:
                                "We couldn’t generate your OTP at the moment. Please check your internet connection and try again.",
                          ));
                        }
                      },
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(Colors
                            .transparent), // Removes the background highlight
                      ),
                      child: Text(
                        'Resend Otp',
                        style: TextStyle(
                            fontSize: 15,
                            color: controller.theme.theme.textGreen),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
