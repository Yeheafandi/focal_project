import 'package:focal_project/bindings/chat_details_binding.dart';
import 'package:focal_project/bindings/my_favorite_binding.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/audiocall_view/audiocall_screen/audiocall_screen.dart';
import 'package:focal_project/view/booking_details_view/booking_details_view/booking_details_view.dart';
import 'package:focal_project/view/book_view/request_to_book_view.dart';
import 'package:focal_project/view/profile_section/card/card_screen.dart';
import 'package:focal_project/view/chat_details_view/chat_details_screen/chat_details_screen.dart';
import 'package:focal_project/view/checkout_view/checkout_view.dart';
import 'package:focal_project/view/checkout_view/payment_complete_view.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:focal_project/view/messages_view/messages_screen/messages_screen.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_screen/my_favorite_screen.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view.dart';
import 'package:focal_project/view/notification_view/notification_screen/notification_screen.dart';
import 'package:focal_project/view/profile_section/help_support/help_screem.dart';
import 'package:focal_project/view/profile_section/language/language_screen.dart';
import 'package:focal_project/view/profile_section/legal_policies/legal_screen.dart';
import 'package:focal_project/view/profile_section/notifications/notifications_screen.dart';
import 'package:focal_project/view/profile_section/personalInfo/personalInfo_screen.dart';
import 'package:focal_project/view/profile_section/profile/profile_screen.dart';
import 'package:focal_project/view/profile_section/security/security_screen.dart';
import 'package:focal_project/view/search_section/search_view/search_view.dart';
import 'package:focal_project/view/splash/splash_screen.dart';
import 'package:focal_project/view/videocall_view/videocall_screen/videocall_screen.dart';
import 'package:focal_project/view/auth/auth_view/otp_screen.dart';
import 'package:focal_project/view/auth/auth_view/reset_password_request_screen.dart';
import 'package:focal_project/view/auth/auth_view/reset_password_screen.dart';
import 'package:focal_project/view/auth/auth_view/signin_screen.dart';
import 'package:focal_project/view/auth/auth_view/signup_screen.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding.dart';
import 'package:focal_project/view/onboarding/onboarding_view/onboarding3.dart';
import 'package:focal_project/widgets/navigation_menu_view/navigation_menu_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/onboarding/onboarding_view/onboarding1.dart';

class AppRoutes {
  static final screens = [
    GetPage(name: Routes.homeview, page: () => HomeView()),
    GetPage(name: Routes.nearbyMap, page: () => NearbyMapView()),
    GetPage(name: Routes.homeview, page: () => HomeView()),
    GetPage(name: Routes.nearbyMap, page: () => NearbyMapView()),
    GetPage(name: Routes.search, page: () => SearchView()),
    GetPage(name: Routes.messageScreen, page: () => MessageScreen()),
    GetPage(name: Routes.bookingDetailsView, page: () => BookingDetailsView()),
    GetPage(name: Routes.requestToBook, page: () => RequestToBookView()),
    GetPage(name: Routes.navigationMenuView, page: () => NavigationMenuView()),
    GetPage(
      name: Routes.chatDetailsScreen,
      page: () => ChatDetailsScreen(),
      binding: ChatDetailsBinding(),
    ),
    GetPage(
      name: Routes.videoCallScreen,
      page: () => VideoCallScreen(),
      // binding: VideoCallBinding(),
    ),
    GetPage(name: Routes.audioCallScreen, page: () => AudioCallScreen()),
    GetPage(name: Routes.checkout, page: () => CheckoutView()),
    GetPage(
      name: Routes.resetrequest,
      page: () => ResetPasswordRequestScreen(),
    ),
    GetPage(name: Routes.resetpassword, page: () => ResetPasswordScreen()),
    GetPage(name: Routes.signinscreen, page: () => SigninScreen()),
    GetPage(name: Routes.signupscreen, page: () => SignupScreen()),
    GetPage(name: Routes.onboarding, page: () => Onboarding()),
    GetPage(name: Routes.onboarding3, page: () => Onboarding3()),
    GetPage(name: Routes.onboarding1, page: () => Onboarding1()),
    GetPage(name: Routes.otpscreen, page: () => OtpScreen()),
    GetPage(
      name: Routes.notificationScreen,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: Routes.myFavoriteScreen,
      page: () => const MyFavoriteScreen(),
      // binding: MyFavoriteBinding(),
    ),
    GetPage(name: Routes.splashscreen, page: () => SplashScreen()),

    GetPage(
      name: Routes.personalInfoScreen,
      page: () => const PersonalInfoScreen(),
    ),
    GetPage(
      name: Routes.securityScreen,
      page: () => const SecurityScreen(),
    ),
    GetPage(
      name: Routes.notificationSettingsScreen,
      page: () => const NotificationsScreen(),
    ),
    GetPage(
      name: Routes.languageScreen,
      page: () => const LanguageScreen(),
    ),
    GetPage(
      name: Routes.helpSupportScreen,
      page: () => const HelpSupportScreen(),
    ),
    GetPage(
      name: Routes.legalPoliciesScreen,
      page: () => const LegalPoliciesScreen(),
    ),
    GetPage(name: Routes.personalInfoScreen, page: () => ProfileScreen()),
    GetPage(name: Routes.cardscreen, page: () => CardScreen()),
    GetPage(name: Routes.paymentComplete, page: () => PaymentCompleteView()),

  ];
}
