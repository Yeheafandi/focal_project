import 'package:focal_project/routes/routes.dart';
import 'package:focal_project/view/booking_details_view/booking_details_view/booking_details_view.dart';
import 'package:focal_project/view/book_view/request_to_book_view.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:focal_project/view/messages_view/messages_screen/messages_screen.dart';
import 'package:focal_project/view/nearby_map_view/nearby_map_view.dart';
import 'package:focal_project/view/search_section/search_view/search_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final screens = [
    GetPage(name: Routes.homeview, page: () => HomeView()),
    GetPage(name: Routes.nearbyMap, page: () => NearbyMapView()),
    GetPage(name: Routes.search, page: () => SearchView()),

    GetPage(name: Routes.bookingDetailsView, page: () => BookingDetailsView()),
  GetPage(name: Routes.homeview, page: () =>  HomeView()),
  GetPage(name: Routes.nearbyMap, page: () =>  NearbyMapView()),
  // GetPage(name: Routes.bookingDetailsView, page: () =>  BookingDetailsView()),
  GetPage(name: Routes.messagesScreen, page: () =>  MessageScreen()),
  GetPage(name: Routes.requestToBook, page: () => RequestToBookView()),
  ];
}
