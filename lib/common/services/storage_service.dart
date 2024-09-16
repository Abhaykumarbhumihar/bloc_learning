import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _preferences;
  Future<StorageService> init()async{
    _preferences=await SharedPreferences.getInstance();
    return this;
  }

  Future<bool>setBool(String key,bool value)async{
    return await _preferences.setBool(key, value);
  }
   getBool(String key){
    return  _preferences.getBool(key)??false;
  }
}