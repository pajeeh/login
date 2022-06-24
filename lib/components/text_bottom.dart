// ignore_for_file: unused_local_variable
import '../colors/colors.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  BottomText({Key? key}) : super(key: key);

  final shadows = [
    const Shadow(
        // bottomLeft
        offset: Offset(0, -0.75),
        color: Colors.white,
        blurRadius: 0.25),
    const Shadow(
        // bottomLeft
        offset: Offset(0, -0.75),
        color: verdeNeon,
        blurRadius: 1.5),
    const Shadow(
        // bottomLeft
        offset: Offset(1, -0.75),
        color: Color.fromARGB(230, 25, 184, 0),
        blurRadius: 0.75),
    const Shadow(
        // bottomLeft
        offset: Offset(0, -0.5),
        color: verdeNeon,
        blurRadius: 0.50),
  ];
  static const shadowsGreen = [
    Shadow(
        // bottomLeft
        offset: Offset(0, -2),
        color: verdeEscuro,
        blurRadius: 30),
    Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: verdeNeon,
        blurRadius: 30),
    Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: verdeNeon,
        blurRadius: 30),
    Shadow(
        // bottomLeft
        offset: Offset(0, 10),
        color: preto,
        blurRadius: 50),
    Shadow(
        // bottomLeft
        offset: Offset(0, -2),
        color: preto,
        blurRadius: 10),
    Shadow(
        // bottomLeft
        offset: Offset(0, -2),
        color: preto,
        blurRadius: 5),
  ];

  @override
  Widget build(BuildContext context) {
    const textBottomVerde = TextStyle(
      color: verdeHacker,
      shadows: shadowsGreen,
      fontSize: 22,
      fontFamily: 'CourierNew',
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    );
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'ADMINISTRATION TERMINAL',
                style: textBottomVerde,
              ),
              Text(
                'SESSION ENCRYPTED',
                style: textBottomVerde,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
