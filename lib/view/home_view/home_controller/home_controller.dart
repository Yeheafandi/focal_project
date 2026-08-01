import 'package:focal_project/core/services/hotel_services.dart';
import 'package:focal_project/model/hotel_model.dart';
import 'package:focal_project/model/near_you_model.dart';
import 'package:focal_project/model/user_profile_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool isProfileLoading = true.obs;
  final RxBool isPopularLoading = true.obs;
  final RxBool isRecommendedLoading = true.obs;
  final RxBool isNearYouLoading = true.obs;
  final RxBool isBestTodayLoading = true.obs;

  final Rxn<UserProfileModel> userProfile = Rxn<UserProfileModel>();
  final RxList<HotelModel> popularHotels = <HotelModel>[].obs;
  final RxList<HotelModel> recommendedHotels = <HotelModel>[].obs;
  final Rxn<NearYouModel> nearYouData = Rxn<NearYouModel>();
  final RxList<HotelModel> bestTodayHotels = <HotelModel>[].obs;

  final RxString selectedCategory = 'all'.obs;
  final List<String> categories = ['all', 'villas', 'hotels', 'apartments'];

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    fetchUserProfile();
    fetchPopularHotels();
    fetchRecommendedHotels();
    fetchNearYouData();
    fetchBestTodayHotels();
  }

  Future<void> fetchUserProfile() async {
    isProfileLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      userProfile.value = UserProfileModel(
        name: "Emilio Kohler",
        avatarUrl:
            "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6",
        location: "San Diego, CA",
      );
    } finally {
      isProfileLoading(false);
    }
  }

  Future<void> fetchPopularHotels() async {
    isPopularLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      // أخذ الفنادق ذات التقييم العالي مثلاً
      popularHotels.assignAll(
        HotelServices.allHotels.where((h) => h.rating >= 4.5).toList(),
      );
    } finally {
      isPopularLoading(false);
    }
  }

  Future<void> fetchRecommendedHotels() async {
    isRecommendedLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      recommendedHotels.assignAll(HotelServices.allHotels.take(2).toList());
    } finally {
      isRecommendedLoading(false);
    }
  }

  Future<void> fetchNearYouData() async {
    isNearYouLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 2200));
      nearYouData.value = NearYouModel(
        latitude: 32.7157,
        longitude: -117.1611,
        mapStaticImageUrl:
            "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/-117.1611,32.7157,13,0/600x300?access_token=mock_token",
        areaName: "San Diego, CA",
      );
    } finally {
      isNearYouLoading(false);
    }
  }

  Future<void> fetchBestTodayHotels() async {
    isBestTodayLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      bestTodayHotels.assignAll(
        HotelServices.allHotels
            .where((h) => h.oldPricePerNight != null)
            .toList(),
      );
    } finally {
      isBestTodayLoading(false);
    }
  }

  void toggleFavorite(HotelModel hotel) {
    hotel.isFavorite = !hotel.isFavorite;
    popularHotels.refresh();
    recommendedHotels.refresh();
    bestTodayHotels.refresh();
  }
}
