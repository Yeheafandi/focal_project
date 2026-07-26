class PaymentCardModel {
  final double balance;
  final String cardNumber;
  final String expiryDate;
  final String type; 

  PaymentCardModel({
    required this.balance,
    required this.cardNumber,
    required this.expiryDate,
    required this.type,
  });

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardModel(
      balance: (json['balance'] as num).toDouble(),
      cardNumber: json['cardNumber'] as String,
      expiryDate: json['expiryDate'] as String,
      type: json['type'] as String,
    );
  }
}