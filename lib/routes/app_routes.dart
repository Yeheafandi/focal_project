import 'package:focal_project/bindings/chat_details_binding.dart';
import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/audiocall_view/audiocall_screen/audiocall_screen.dart';
import 'package:focal_project/view/booking_details_view/booking_details_view/booking_details_view.dart';
import 'package:focal_project/view/chat_details_view/chat_details_screen/chat_details_screen.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:focal_project/view/messages_view/messages_screen/messages_screen.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view.dart';
import 'package:focal_project/view/search_section/search_view/search_view.dart';
import 'package:focal_project/view/videocall_view/videocall_screen/videocall_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final screens = [
    GetPage(name: Routes.homeview, page: () => HomeView()),
    GetPage(name: Routes.nearbyMap, page: () => NearbyMapView()),
    GetPage(name: Routes.search, page: () => SearchView()),
    GetPage(name: Routes.messageScreen, page: () => MessageScreen()),
    GetPage(name: Routes.bookingDetailsView, page: () => BookingDetailsView()),
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
    GetPage(
      name: Routes.audioCallScreen,
      page: () => AudioCallScreen(),
      
    ),
  ];
}
