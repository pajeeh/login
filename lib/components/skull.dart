import 'package:flutter/material.dart';

class Skull extends StatelessWidget {
  const Skull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/skull.png',
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.20,
      alignment: Alignment.center,
    );
  }
}
