import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, Function chamafuncao) {
  // configura o button
  Widget okButton = GestureDetector(
      child: ElevatedButton(
    child: Text("OK",
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      chamafuncao();
      Navigator.of(context, rootNavigator: true).pop();
    },
  ));
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Login não realizado"),
    content: Text("Confira seu login e tente novamente."),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
