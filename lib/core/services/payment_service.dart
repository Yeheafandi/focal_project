import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:focal_project/core/class/crud.dart';
import 'package:focal_project/core/class/status_classes.dart';
import 'package:focal_project/core/constants/stripe_keys.dart';

class PaymentService {
  static const String secretKey = StripeKeys.stripeSecretKey;

  static Future<StatusClasses> pay({
    required double amount,
    String currency = "usd",
  }) async {
    try {
      // إنشاء Payment Intent
      final result = await _createPaymentIntent(
        amount: amount,
        currency: currency,
      );
      if (result.isLeft()) {
        return result.fold((l) => l, (_) => throw UnimplementedError());
      }
      final paymentIntent = result.getOrElse(() => {});
      final clientSecret = paymentIntent["client_secret"];
      // تجهيز Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "Grand Hotel",
        ),
      );

      // عرض الدفع
      await Stripe.instance.presentPaymentSheet();

      print("Payment Success");
      return StatusClasses.success;
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        return StatusClasses.customError("Payment canceled");
      }
      print("Stripe Error: ${e.error.localizedMessage}");
      return StatusClasses.customError(
        e.error.localizedMessage ?? "unkown error",
      );
    } catch (e) {
      print("Payment Error: $e");
      return StatusClasses.customError(e.toString());
    }
  }

  static Future<Either<StatusClasses, Map<String, dynamic>>>
  _createPaymentIntent({
    required double amount,
    required String currency,
  }) async {
    final response = await Crud.postData(
      uri: "https://api.stripe.com/v1/payment_intents",
      headers: {
        "Authorization": "Bearer $secretKey",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "amount": (amount * 100).toInt().toString(),
        "currency": currency,
        "payment_method_types[]": "card",
      },
      withData: true,
      encodeBody: false,
    );

    return response.fold(
      (e) {
        return Left(e);
      },
      (data) {
        try {
          return Right(jsonDecode(data));
        } catch (e) {
          return Left(
            StatusClasses.customError("Invalid response from Stripe"),
          );
        }
      },
    );
  }
}
