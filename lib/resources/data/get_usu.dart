import 'package:dio/dio.dart';
import 'package:flutter_application_2/models/user_info.dart';

class GetUsu {
  Dio dio = Dio();
  String urlBase = "https://api.info.ufrn.br";
  String path = "/usuario/v1/usuarios/info";
  String apiKey = 'CCYybpLZqfyPyvxzjLQpfiFg6kI7bwWfhwmcOIhq';
  Future getUsu(String acessToken) async {
    String allUrl = "$urlBase$path";
    Response responseUsu = await dio.get(allUrl,
        options: Options(headers: {
          'x-api-key': apiKey,
          'Authorization': 'bearer $acessToken',
          'Content-Type': 'application/json;charset=UTF-8',
        }));
    print(responseUsu);
    Usuario usu = Usuario.fromJson(responseUsu.data);
    print('pegou o id do usuário');
    return usu;
  }
}
