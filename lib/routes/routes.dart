part of 'app_pages.dart';

class Routes {
  Routes._();
  static const home = _Pages.home;
  static const mobileView = _Pages.mobileView;
  static const mobileVerificationOTPScreen = _Pages.mobileVerificationOTPScreen;
  static const emailPassword = _Pages.emailPassword;
  static const emailVarification = _Pages.emailVarification;
  static const menu = _Pages.menu;
  static const profile = _Pages.profile;
  static const userAccount = _Pages.userAccount;
  static const userAddress = _Pages.userAddress;
  static const cart = _Pages.cart;
  static const onboardingUserDetails = _Pages.onboardingUserDetails;
  static const editUserprofile = _Pages.editUserprofile;
  static const reviewApp = _Pages.reviewApp;
  static const help = _Pages.help;
}

abstract class _Pages {
  _Pages._();

  static const home = "/street-noshery-home";
  static const mobileView = "/street-noshery-mobile-view";
  static const mobileVerificationOTPScreen = "/street-noshery-mobile-verification";
  static const emailPassword = "/street-noshery-email-password";
  static const emailVarification = "/street-noshery-email-verification";
  static const menu = "/street-noshery-menu";
  static const profile = "/street-noshery-profile";
  static const userAccount = "/street-noshery-user-account";
  static const userAddress = "/street-noshery-user-address";
  static const cart = "/street-noshery-cart";
  static const onboardingUserDetails = "/street-noshery-user-onboarding-details";
  static const editUserprofile = "/street-noshery-edit-user-profile";
  static const reviewApp = "/street-noshery-review-app";
  static const help = "/street-noshery-help";
}