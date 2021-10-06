import 'package:flutter_application_2/models/singleton_factory.dart';
import 'package:flutter_application_2/models/token.dart';
import 'package:flutter_application_2/models/user_info.dart';
import 'package:flutter_application_2/resources/data/get_local_token.dart';
import 'package:flutter_application_2/resources/data/get_usu.dart';

class UserRepository {
  GetUsu usu = GetUsu();
  LocalKey tokenLocal = LocalKey();
  Token? tokenAcess = SingletonClass.key;

  Future getUser() async {
    //Token token = await tokenLocal.getAut();
    print('token do singleton --->${tokenAcess!.access}');
    Usuario validationUser = await usu.getUsu(tokenAcess!.access);
    if (validationUser.nome.isNotEmpty) {
      return validationUser;
    } else {
      return print('Usuário não encontrado');
    }
  }
}
