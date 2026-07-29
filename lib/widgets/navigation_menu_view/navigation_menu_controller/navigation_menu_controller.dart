import 'package:flutter/material.dart';
import 'package:focal_project/view/book_view/my_booking_view.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:focal_project/view/messages_view/messages_screen/messages_screen.dart';
import 'package:focal_project/view/profile_section/profile/profile_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeView(),
    MyBookingView(),
    const MessageScreen(),
     ProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
