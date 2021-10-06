import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key, this.onPressed}) : super(key: key);
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipOval(
        child: Container(
            width: size.width * 0.35,
            child: ElevatedButton(
              child: Text('Entrar', style: TextStyle(color: Colors.white)),
              onPressed: () => onPressed(),
            )));
  }
}
