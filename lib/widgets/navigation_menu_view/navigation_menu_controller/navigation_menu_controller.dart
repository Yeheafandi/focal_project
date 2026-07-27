import 'package:flutter/material.dart';
import 'package:focal_project/bindings/my_favorite_binding.dart';
import 'package:focal_project/view/book_view/my_booking_view.dart';
import 'package:focal_project/view/home_view/home_view.dart';
import 'package:focal_project/view/messages_view/messages_screen/messages_screen.dart';
import 'package:focal_project/view/my_favorite_view/my_favorite_screen/my_favorite_screen.dart';
import 'package:focal_project/view/profile/profile_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;
@override
  void onInit() {
    super.onInit();
    MyFavoriteBinding().dependencies();
  }

  final List<Widget> screens = [
    HomeView(),
    MyBookingView(),
    MyFavoriteScreen(),
    const MessageScreen(),
     const  ProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}