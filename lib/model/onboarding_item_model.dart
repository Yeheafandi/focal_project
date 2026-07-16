import 'package:focal_project/core/constants/app_images.dart';

class OnboardingItemModel {
  final String title;
  final String description;
  final String imageUrl;
  OnboardingItemModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final List<OnboardingItemModel> onboardingItems = [
    OnboardingItemModel(
      title: 'Welcome to Our App',
      description: 'Discover new features and functionalities.',
      imageUrl: AppImages.onBoarding1,
    ),
    OnboardingItemModel(
      title: 'Stay Connected',
      description: 'Keep in touch with your friends and family.',
      imageUrl: AppImages.onBoarding2,
    ),
    OnboardingItemModel(
      title: 'Achieve Your Goals',
      description: 'Track your progress and reach new heights.',
      imageUrl: AppImages.onBoarding3,
    ),
  ];}