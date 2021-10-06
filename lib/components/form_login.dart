import 'package:flutter/material.dart';

import 'package:flutter_application_2/Components/botton.dart';
import 'package:flutter_application_2/blocs/token_bloc.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({
    Key? key,
    required this.user,
    required this.password,
    required this.changeUser,
    required this.changePass,
    required this.loading,
    required this.onSearch,
    required this.token,
  }) : super(key: key);
  final String user;
  final String password;
  final Function changeUser;
  final Function changePass;
  final Function onSearch;
  final bool loading;
  final TokenBloc token;

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> with TickerProviderStateMixin {
  final _formkey = GlobalKey<FormState>();
  bool showPass = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.all(20),
        child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                    onChanged: (value) => widget.changeUser(value),
                    decoration: InputDecoration(
                      icon: Icon(
                        IconData(58513, fontFamily: 'MaterialIcons'),
                        color: Colors.white,
                      ),
                      labelText: 'Usuário',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor, coloque seu nome de usuário';
                      }
                    }),
                TextFormField(
                    onChanged: (value) => widget.changePass(value),
                    decoration: InputDecoration(
                        icon: Icon(IconData(58289, fontFamily: 'MaterialIcons'),
                            color: Colors.white),
                        labelText: 'Senha',
                        suffixIcon: GestureDetector(
                          child: Icon(
                              showPass == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white),
                          onTap: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                        )),
                    obscureText: showPass == false ? true : false,
                    validator: (value) {
                      if (value!.isEmpty) return 'Por favor, coloque sua senha';
                    }),
                Padding(
                  padding: EdgeInsets.all(size.height * 0.01),
                ),
                StreamBuilder<LoginState>(
                    stream: widget.token.loginOutput,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.data == LoginState.carregando) {
                        return CircularProgressIndicator(
                          value: controller.value,
                        );
                      } else {
                        return Bottom(
                            onPressed:
                                widget.user.isEmpty || widget.password.isEmpty
                                    ? null
                                    : () {
                                        if (_formkey.currentState!.validate()) {
                                          widget.onSearch();
                                        }
                                      });
                      }
                    })
              ],
            )));
  }
}
