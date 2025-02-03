import 'package:get/get.dart';
import 'package:street_noshery/cart/bindings/street_noshery_cart_binding.dart';
import 'package:street_noshery/cart/views/street_noshery_cart_view.dart';
import 'package:street_noshery/home_page/bindings/home_binding.dart';
import 'package:street_noshery/home_page/views/home_page.dart';
import 'package:street_noshery/menu/binding/street_noshery_menu_binding.dart';
import 'package:street_noshery/menu/view/street_noshery_menu_view.dart';
import 'package:street_noshery/onboarding/bindings/street_noshery_onboarding_binding.dart';
import 'package:street_noshery/onboarding/views/street_noshery_address_input_view.dart';
import 'package:street_noshery/onboarding/views/street_noshery_email_view.dart';
import 'package:street_noshery/onboarding/views/street_noshery_mobile_number_view.dart';
import 'package:street_noshery/onboarding/views/street_noshery_otp_view.dart';
import 'package:street_noshery/profile/views/street_noshery_profile_view.dart';
import 'package:street_noshery/profile/widgets/street_noshery_help_widget.dart';
import 'package:street_noshery/profile/widgets/street_noshery_profile_edit_widget.dart';
import 'package:street_noshery/reviews/binding/street_noshery_app_review_binding.dart';
import 'package:street_noshery/reviews/view/street_noshery_review_app_view.dart';
import 'package:street_noshery/street_noshery_user_account/bindings/street_noshery_user_account_binding.dart';
import 'package:street_noshery/street_noshery_user_address/bindings/street_noshery_user_address_binding.dart';
import 'package:street_noshery/street_noshery_user_address/views/street_noshery_user_address_view.dart';
import '../profile/bindings/street_noshery_profile_binding.dart';
import '../street_noshery_user_account/views/street_noshery_user_account_view.dart';
part 'routes.dart';

class Pages {
  Pages._();

  static final routes = [
    GetPage(
      name: _Pages.home, 
      page: () => const StreetNosheryHomePage(),
      binding: StreetNosheryHomeBinding()
      ),
    GetPage(
      name: _Pages.mobileView, 
      page: () => const StreetNosheryMobileNumberView(),
      binding: StreetNosheryOnboardingbinding()
      ),
    GetPage(
      name: _Pages.mobileVerificationOTPScreen, 
      page: () => const StreetNosheryMobileVerificationView(),
      binding: StreetNosheryOnboardingbinding()),
    GetPage(
      name: _Pages.emailPassword, 
      page: () => const StreetNosheryEmailPassCodeView(),
      binding: StreetNosheryOnboardingbinding()),
    // GetPage(
    //   name: _Pages.emailVarification, 
    //   page: () => const ),
    GetPage(
      name: _Pages.menu, 
      page: () => const StreetNosheryMenuView(),
      binding: StreetNosheryMenuBinding()),
    GetPage(
      name: _Pages.profile, 
      page: () => const StreetNosheryProfileView(),
      binding: StreetNosheryProfileBinding()),
    GetPage(
      name: _Pages.userAccount, 
      page: () => const StreetNosheryUserAccountView(),
      binding: StreetNosheryUserAccountBinding()),
    GetPage(
      name: _Pages.userAddress, 
      page: () => const StreetNosheryUserAddressView(),
      binding: StreetNosheryUserAddressBinding()),
    GetPage(
      name: _Pages.cart, 
      page: () => const StreetNosheryCartView(),
      binding: StreetNosheryCartBinding()),
    GetPage(
      name: _Pages.onboardingUserDetails, 
      page: () => const OnboardingUserDetails(),
      binding: StreetNosheryOnboardingbinding()),
    GetPage(
      name: _Pages.editUserprofile, 
      page: () => const StreetNosheryProfileEditWidget(),
      binding: StreetNosheryProfileBinding()),
    GetPage(
      name: _Pages.reviewApp, 
      page: () => const StreetNosheryAppReviewView(),
      binding: StreetNosheryAppReviewBinding()),
    GetPage(
      name: _Pages.help, 
      page: () => const StreetNosheryHelp(),
      binding: StreetNosheryHomeBinding())
  ];
}