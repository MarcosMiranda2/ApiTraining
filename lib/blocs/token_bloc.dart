import 'package:flutter_application_2/resources/repositories/authetication_repository.dart';
import 'package:rxdart/rxdart.dart';

class TokenBloc {
  AutheticationRepository repository = AutheticationRepository();

  final BehaviorSubject<LoginState> _log =
      BehaviorSubject<LoginState>.seeded(LoginState.initialState);
  Stream<LoginState> get loginOutput => _log.stream;
  Sink<LoginState> get loginEvent => _log.sink;

  Future<void> searchToken(String login, String passe) async {
    loginEvent.add(LoginState.carregando);
    try {
      await repository.getAut(login, passe);
      if (await repository.isAut() == true) {
        loginEvent.add(LoginState.logado);
      }
    } catch (erro) {
      print(erro);
      loginEvent.add(LoginState.error);
    }
  }

  void resetState() {
    loginEvent.add(LoginState.initialState);
  }

  dispose() {
    _log.close();
  }
}

enum LoginState {
  initialState,
  carregando,
  logado,
  error,
}
