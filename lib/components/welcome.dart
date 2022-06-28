import 'package:flutter/material.dart';

import '../colors/colors.dart';

class WelcomeText extends StatelessWidget {
  WelcomeText({Key? key}) : super(key: key);

  final shadowsWhite = [
    const Shadow(
      offset: Offset(0, 5),
      color: preto,
      blurRadius: 50,
    ),
    const Shadow(
      offset: Offset(0, 0.25),
      color: preto,
      blurRadius: 1,
    ),
    const Shadow(
      offset: Offset(0, -0.25),
      color: preto,
      blurRadius: 1,
    ),
    const Shadow(
      offset: Offset(0, -0.25),
      color: cinza,
      blurRadius: 0,
    ),
    const Shadow(
      offset: Offset(0, -0.25),
      color: branco,
      blurRadius: 0,
    ),
    const Shadow(
      offset: Offset(0, -1.25),
      color: preto,
      blurRadius: 0,
    ),
  ];

  final shadowsGreen = [
    const Shadow(
        // bottomLeft
        offset: Offset(0, -2),
        color: verdeEscuro,
        blurRadius: 30),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: verdeNeon,
        blurRadius: 30),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: verdeNeon,
        blurRadius: 30),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 10),
        color: preto,
        blurRadius: 50),
    const Shadow(
        // bottomLeft
        offset: Offset(0, -2),
        color: preto,
        blurRadius: 10),
    const Shadow(
        // bottomLeft
        offset: Offset(0, -2),
        color: preto,
        blurRadius: 5),
  ];

  @override
  Widget build(BuildContext context) {
    final welcomeBranco = TextStyle(
        color: branco,
        fontSize: 32,
        shadows: shadowsWhite,
        letterSpacing: 0.75,
        fontWeight: FontWeight.w600);
    final welcomeVerde = TextStyle(
        color: verdeNeon,
        fontSize: 32,
        shadows: shadowsGreen,
        letterSpacing: 0.75,
        fontWeight: FontWeight.w600);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome',
                style: welcomeBranco,
              ),
              Text(
                'to',
                style: welcomeBranco,
              ),
              Text(
                'Hacker News',
                style: welcomeVerde,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
