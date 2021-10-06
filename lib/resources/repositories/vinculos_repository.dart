import 'package:flutter_application_2/models/Vinculos.dart';
import 'package:flutter_application_2/models/singleton_factory.dart';
import 'package:flutter_application_2/models/token.dart';
import 'package:flutter_application_2/models/user_info.dart';
import 'package:flutter_application_2/resources/data/get_local_token.dart';
import 'package:flutter_application_2/resources/data/get_vinculos.dart';
import 'package:flutter_application_2/resources/repositories/user_repository.dart';

class VinculoRepository {
  Vinculo vinc = Vinculo();
  UserRepository user = UserRepository();
  LocalKey keyAcess = LocalKey();
  Token? tokenAcess = SingletonClass.key;
  Future getVinculos() async {
    Usuario acessId = await user.getUser();
    List<Vinculos> acessVinc =
        await vinc.getVinculos(acessId.id, tokenAcess!.access);
    print(acessVinc);
    return acessVinc;
  }
}
