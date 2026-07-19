import 'package:focal_project/view/my_favorite_view/my_favorite_controller/my_favorite_controller.dart';
import 'package:get/get.dart';

import 'package:focal_project/core/services/favorite_service.dart';

class MyFavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyFavoriteService>(
      () => MyFavoriteService(),
    );

    Get.lazyPut<MyFavoriteController>(
      () => MyFavoriteController(
        service: Get.find<MyFavoriteService>(),
      ),
    );
  }
}