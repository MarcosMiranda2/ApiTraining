import 'dart:convert';

import 'package:flutter_application_2/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalKey {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final String key = 'token';
  late SharedPreferences cache;

  Future<void> setAut(Token token) async {
    cache = await prefs;
    cache.setString(key, jsonEncode(token));
  }

  Future<Token> getAut() async {
    cache = await prefs;
    String? tokenString = cache.getString(key);
    print('tokenString ----> $tokenString');
    if (tokenString != null) {
      var tokenObj = jsonDecode(tokenString);
      Token token = Token.fromJson(tokenObj);
      return token;
    } else {
      return getAut();
    }
  }

  Future<bool> isAut() async {
    cache = await prefs;
    print('----> isaut:${cache.getString(key)}');
    if (cache.getString(key) == null || cache.getString(key) == '') {
      return false;
    }
    return true;
  }

  Future<void> deleteAut() async {
    cache = await prefs;
    cache.setString(key, '');
  }
}
