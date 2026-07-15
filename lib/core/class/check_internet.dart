import 'dart:io';
import 'package:flutter/services.dart';

Future CheckInternet() async {
  print("checking internet");
  try {
    var result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("success");
      return true;
    }
  } on PlatformException catch (e) {
    print("eror intenet");
    print(e.toString());
    return false;
  } on SocketException catch (e) {
    print("eror intenet");
    print(e.toString());
    return false;
  }
}