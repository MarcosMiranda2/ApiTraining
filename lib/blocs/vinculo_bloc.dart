import 'package:flutter_application_2/models/Vinculos.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_application_2/resources/repositories/vinculos_repository.dart';

class VinculoBloc {
  VinculoRepository vic = VinculoRepository();
  final BehaviorSubject<List<Vinculos>> _vic =
      BehaviorSubject<List<Vinculos>>.seeded([]);
  Stream<List<Vinculos>> get vinculoOutput => _vic.stream;
  Sink<List<Vinculos>> get vinculoEvent => _vic.sink;

  Future<void> searchVinculo() async {
    List<Vinculos> listVinc = await vic.getVinculos();
    vinculoEvent.add(listVinc);
  }

  dispose() {
    _vic.close();
  }
}
