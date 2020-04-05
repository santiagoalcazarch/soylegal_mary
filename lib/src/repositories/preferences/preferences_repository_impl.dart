import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preference_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository{

  static const String _loggedInKey = "loginKey";
  
  SharedPreferences _instance;

  PreferencesRepositoryImpl({@required SharedPreferences instance})
    : assert(instance != null),
    _instance = instance;

  @override
  Future<void> clearLoginData() async {
    await _instance.clear();
  }

  @override
  Future<void> setLoginState(bool isLoggedin) async {
    await _instance.setBool(_loggedInKey, isLoggedin);    
  }

  @override
  bool getLoginState() {
    return _instance.getBool(_loggedInKey);
  }

  @override
  bool isInstanceConstainsKey() {
    return _instance.containsKey(_loggedInKey);
  }

}