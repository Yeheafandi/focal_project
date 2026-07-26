
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{
  static const String _key='isLogged';
  static late SharedPreferences _prefs;
 final  RxBool isRemembered=false.obs;

      Future<MyServices> remembered() async{
   _prefs=await SharedPreferences.getInstance();
  isRemembered.value =_prefs.getBool(_key)?? false;
  return this;
}
 Future<void> setRemember ( bool value) async{
  isRemembered.value=value;

        await _prefs.setBool(_key,value );
}

}
