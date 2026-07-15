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

  final RxString selectedCategory = 'All'.obs;
  final List<String> categories = ['All', 'Villas', 'Hotels', 'Apartments'];

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
        avatarUrl: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6",
        location: "San Diego, CA",
      );
    } finally {
      isProfileLoading(false);
    }
  }

  Future<void> fetchPopularHotels() async {
    isPopularLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 1800));
      popularHotels.assignAll([
        HotelModel(
          id: "1",
          name: "The Horizon Retreat",
          location: "Los Angeles, CA",
          pricePerNight: 480,
          rating: 4.5,
          imageUrl: "https://images.unsplash.com/photo-1540555700478-4be289fbecef",
        ),
        HotelModel(
          id: "2",
          name: "Opal Grove Inn",
          location: "San Diego, CA",
          pricePerNight: 190,
          rating: 4.5,
          imageUrl: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
        ),
      ]);
    } finally {
      isPopularLoading(false);
    }
  }

  Future<void> fetchRecommendedHotels() async {
    isRecommendedLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 2000));
      recommendedHotels.assignAll([
        HotelModel(
          id: "3",
          name: "Serenity Sands",
          location: "Honolulu, HI",
          pricePerNight: 270,
          rating: 4.0,
          imageUrl: "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4",
        ),
        HotelModel(
          id: "4",
          name: "Elysian Suites",
          location: "San Diego, CA",
          pricePerNight: 320,
          rating: 3.8,
          imageUrl: "https://images.unsplash.com/photo-1584132967334-10e028bd69f7",
        ),
      ]);
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
        // رابط صورة خريطة افتراضية نظيفة ومحاكية للتصميم الرسومي للخريطة في طلبك
        mapStaticImageUrl: "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/-117.1611,32.7157,13,0/600x300?access_token=mock_token", 
        areaName: "San Diego, CA",
      );
    } finally {
      isNearYouLoading(false);
    }
  }

  Future<void> fetchBestTodayHotels() async {
    isBestTodayLoading(true);
    try {
      await Future.delayed(const Duration(milliseconds: 2500));
      bestTodayHotels.assignAll([
        HotelModel(
          id: "5",
          name: "Tranquil Shores",
          location: "Santa Monica, CA",
          pricePerNight: 120,
          oldPricePerNight: 199,
          rating: 4.4,
          reviewsCount: 532,
          imageUrl: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
        ),
        HotelModel(
          id: "6",
          name: "Oceanic Vista",
          location: "Malibu, CA",
          pricePerNight: 150,
          oldPricePerNight: 250,
          rating: 4.7,
          reviewsCount: 128,
          imageUrl: "https://images.unsplash.com/photo-1473116763269-25541077c683",
        ),
      ]);
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