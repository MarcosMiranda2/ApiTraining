import 'package:flutter_application_2/models/singleton_factory.dart';
import 'package:flutter_application_2/models/token.dart';
import 'package:flutter_application_2/resources/data/get_authetication.dart';
import 'package:flutter_application_2/resources/data/get_local_token.dart';

class AutheticationRepository {
  Authetication aut = Authetication();
  LocalKey tokenLocal = LocalKey();

  Future getAut(String user, String pass) async {
    if (await tokenLocal.isAut() == true) {
      return tokenLocal.getAut();
    } else {
      Token token = await aut.getAut(user, pass);
      await tokenLocal.setAut(token);
      if (SingletonClass.key == null) {
        SingletonClass.key = token;
      }
      return token;
    }
  }

  Future<Token> getToken() async {
    return tokenLocal.getAut();
  }

  Future<bool> isAut() async {
    return await tokenLocal.isAut();
  }
}
