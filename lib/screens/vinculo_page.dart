import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocs/vinculo_bloc.dart';
import 'package:flutter_application_2/models/Vinculos.dart';

class VinculoPage extends StatefulWidget {
  const VinculoPage({Key? key}) : super(key: key);

  @override
  _VinculoPageState createState() => _VinculoPageState();
}

class _VinculoPageState extends State<VinculoPage>
    with TickerProviderStateMixin {
  late VinculoBloc vicbloc;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
    vicbloc = VinculoBloc();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    searchVinculos();
  }

  searchVinculos() async {
    await vicbloc.searchVinculo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Vínculos", style: TextStyle(fontSize: 24.0)),
          backgroundColor: Colors.grey,
        ),
        body: StreamBuilder<List<Vinculos>>(
            stream: vicbloc.vinculoOutput,
            initialData: [],
            builder: (context, snapshot) {
              print('-------->  ${snapshot.data}');
              if (snapshot.hasData && snapshot.data != []) {
                List<Vinculos> vinc = snapshot.data as List<Vinculos>;
                return Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height,
                        maxWidth: MediaQuery.of(context).size.width),
                    alignment: Alignment.center,
                    child: ListView.builder(
                        itemCount: vinc.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: ListTile(
                              title: Text(vinc[index].course),
                              subtitle: Text(
                                  '${vinc[index].typeVinculo} ------- ${vinc[index].active}'),
                            ),
                          );
                        }));
              } else {
                return Center(
                    child: Container(
                        child: CircularProgressIndicator(
                  value: controller.value,
                )));
              }
            }));
  }
}
