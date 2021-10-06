import 'package:dio/dio.dart';

import 'package:flutter_application_2/models/token.dart';

class Authetication {
  Dio dio = Dio();
  String urlBase = "https://autenticacao.info.ufrn.br";
  String path = "/authz-server/oauth/token";
  String client = "api-teste-sinfo-id";
  String secret = "segredo";
  String passflow = "password";

  Future getAut(String user, String pass) async {
    String allUrl = "$urlBase$path";
    var response = await dio.post(allUrl, queryParameters: {
      "client_id": client,
      "client_secret": secret,
      "grant_type": passflow,
      "username": user,
      "password": pass
    });
    Token userToken = Token.fromJson(response.data);
    return userToken;

    /* on DioError catch (e) {
      throw (e.message);
    }*/
  }
}
