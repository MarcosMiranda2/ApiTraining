import 'package:dio/dio.dart';

import 'package:flutter_application_2/models/Vinculos.dart';

class Vinculo {
  Dio dio = Dio();
  String urlBase = "https://api.info.ufrn.br";
  String path = "/vinculo";
  String apiKey = 'CCYybpLZqfyPyvxzjLQpfiFg6kI7bwWfhwmcOIhq';

  Future getVinculos(int usuId, String tokenAcess) async {
    String allUrl = "$urlBase$path/v1/vinculos?";
    Response response = await dio.get(allUrl,
        queryParameters: {
          'id-usuario': usuId,
        },
        options: Options(headers: {
          'x-api-key': apiKey,
          'Authorization': 'bearer $tokenAcess',
          'Content-Type': 'application/json;charset=UTF-8',
        }));
    List<Vinculos> listVincul =
        (response.data as List).map((e) => Vinculos.fromJson(e)).toList();
    print(response);
    print('pegou os vinculos');
    return listVincul;
  }
}
