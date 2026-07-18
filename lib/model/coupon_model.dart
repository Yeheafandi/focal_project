class CouponModel {
  final String id;
  final String title;
  final int discountPercentage;
  final String couponType;
  final int expiryDays;
  bool isSelected;

  CouponModel({
    required this.id,
    required this.title,
    required this.discountPercentage,
    required this.couponType,
    required this.expiryDays,
    this.isSelected = false,
  });

  String get expiryText {
    final dayLabel = expiryDays == 1 ? 'day' : 'days';
    return 'Expired in $expiryDays $dayLabel';
  }
}
