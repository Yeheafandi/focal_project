import 'package:flutter/material.dart';
import 'package:focal_project/view/book_view/my_booking_view.dart';
import 'package:focal_project/view/book_view/request_to_book_view.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:focal_project/view/messages_view/messages_screen/messages_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeView(),
    //هدول  بس حاليا شاشات ثابتة رح  نحذفن لما اعرف شو اسماء الشاشات
    // const Scaffold(body: Center(child: Text('My Booking Screen'))),
    // const Scaffold(body: Center(child: Text('Message Screen'))),
    MyBookingView(),
    const MessageScreen(),
    const Scaffold(body: Center(child: Text('Profile Screen'))),

    // const ProfileView(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
