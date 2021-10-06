import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter_application_2/Components/form_login.dart';
import 'package:flutter_application_2/Screens/alertDialogs.dart';
import 'package:flutter_application_2/blocs/vinculo_bloc.dart';
import '../blocs/token_bloc.dart';
import 'package:flutter_application_2/screens/vinculo_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _user = '';
  String _password = '';
  bool _loading = false;
  late TokenBloc tokenbloc;
  late VinculoBloc vincbloc;

  @override
  void initState() {
    super.initState();
    tokenbloc = TokenBloc();
    vincbloc = VinculoBloc();
  }

  Future<void> procuraToken() async {
    tokenbloc.searchToken(_user, _password);
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final iskeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.grey,
            body: Container(
                width: size.width,
                height: size.height - MediaQuery.of(context).padding.top,
                alignment: Alignment.center,
                child: Column(children: [
                  if (!iskeyBoard)
                    CachedNetworkImage(
                        imageUrl: "https://i.imgur.com/Ie5WHYX.png",
                        imageBuilder: (context, imageProvider) => Column(
                              children: <Widget>[
                                Container(
                                  width: size.width * 0.5,
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.08),
                                  padding: EdgeInsets.all(100),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                  SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      Container(
                          child: FormLogin(
                              token: tokenbloc,
                              user: _user,
                              changeUser: (value) => setState(() {
                                    _user = value;
                                  }),
                              password: _password,
                              changePass: (value) => setState(() {
                                    _password = value;
                                  }),
                              loading: _loading,
                              onSearch: procuraToken)),
                      StreamBuilder<LoginState>(
                          stream: tokenbloc.loginOutput,
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.data == LoginState.error) {
                              _user = '';
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                showAlertDialog(context, tokenbloc.resetState);
                              });
                              return SizedBox.shrink();
                            } else if (snapshot.hasData &&
                                snapshot.data == LoginState.logado) {
                              print('passou pra outra página');
                              WidgetsBinding.instance!
                                  .addPostFrameCallback((_) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => VinculoPage()));
                              });
                              return SizedBox.shrink();
                            } else {
                              return SizedBox.shrink();
                            }
                          }),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.125),
                        child: Text(
                            "UNIVERSIDADE FEDERAL DO RIO GRANDE DO NORTE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.03)),
                      ),
                      Text("SUPERINTENDÊNCIA DE INFORMÁTICA",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.03)),
                    ],
                  ))
                ]))));
  }
}
