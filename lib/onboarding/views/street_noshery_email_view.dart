import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_noshery/common/common_loader.dart';
import 'package:street_noshery/onboarding/controllers/street_noshery_onboarding_controller.dart';
import 'package:street_noshery/routes/app_pages.dart';

class StreetNosheryEmailPassCodeView
    extends GetView<StreetNosheryOnboardingController> {
  const StreetNosheryEmailPassCodeView({super.key});

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
              controller.resetOtp();
              Get.back();
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: SizedBox(
            width: Get.width,
            child: FloatingActionButton(
              onPressed: (controller.isPasswordValid.value &&
                      !controller.isPasswordEmpty.value &&
                      controller.isEmailValid.value &&
                      !controller.isEmailEmpty.value)
                  ? () async {
                      showLoader();
                      await controller.saveEmailDetails();
                      hideLoader();
                      Get.toNamed(Routes.onboardingUserDetails);
                    }
                  : null,
              backgroundColor: (controller.isPasswordValid.value &&
                      !controller.isPasswordEmpty.value &&
                      controller.isEmailValid.value &&
                      !controller.isEmailEmpty.value)
                  ? Colors.black
                  : Colors.grey.shade400,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30), // <-- adds round borders
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                    color: (controller.isPasswordValid.value &&
                            !controller.isPasswordEmpty.value &&
                            controller.isEmailValid.value &&
                            !controller.isEmailEmpty.value)
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
                    "Email",
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
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: (controller.isEmailValid.value)
                                  ? controller.theme.theme.textGreen
                                  : controller.theme.theme.errorText,
                              width: 2.0), // On focus
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        controller.emailController.text = value;
                        controller.validateEmail(email: value);
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: !controller.isEmailValid.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Please enter a valid email",
                          style: TextStyle(
                            fontSize: 15,
                            color: controller.theme.theme.errorText,
                          )),
                    )),
                Visibility(
                    visible: controller.isEmailEmpty.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Please enter an email",
                          style: TextStyle(
                            color: controller.theme.theme.textPrimary,
                            fontSize: 15
                          )),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Password",
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
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: (controller.isPasswordValid.value)
                                  ? controller.theme.theme.textGreen
                                  : controller.theme.theme.errorText,
                              width: 2.0), // On focus
                        )),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      controller.passwordController.text = value;
                      controller.isPasswordValid.value =
                          controller.validatepass(password: value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: controller.isPasswordEmpty.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Please enter password",
                          style: TextStyle(
                            color: controller.theme.theme.textPrimary,
                            fontSize: 15
                          )),
                    )),
                Visibility(
                    visible: !controller.isPasswordValid.value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          "Please enter a valid password with lowercase, uppercase, special char and number. Password must between 8-10 char.",
                          style: TextStyle(
                            color: controller.theme.theme.errorText,
                            fontSize: 15
                          )),
                    )),
              ],
            )),
      );
    });
  }
}
