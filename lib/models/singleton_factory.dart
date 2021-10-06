import 'package:flutter_application_2/models/token.dart';

class SingletonClass {
  static SingletonClass? _instance;
  static Token? key;

  SingletonClass._internal() {
    _instance = this;
  }
  factory SingletonClass() => _instance ?? SingletonClass._internal();
}
