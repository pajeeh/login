import 'package:flutter/material.dart';
import 'package:login/colors/colors.dart';

class Password extends StatefulWidget {
  Password({Key? key}) : super(key: key);

  final TextEditingController senhaController = TextEditingController();

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  get senhaController => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.1,
        child: TextField(
          controller: senhaController,
          obscureText: true,
          obscuringCharacter: '\u2731',
          style: const TextStyle(
            color: verdeClaro,
            fontSize: 25,
            fontFamily: 'CourierNew',
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
          cursorColor: verdeNeon,
          cursorWidth: 13,
          cursorHeight: 30,
          decoration: const InputDecoration(
            icon: Icon(
              Icons.lock_sharp,
              size: 30,
              color: verdeNeon,
            ),
            labelText: 'Password',
            labelStyle: TextStyle(
              color: verde,
              fontSize: 21,
              fontFamily: 'CourierNew',
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: verdeMuitoEscuro,
                width: 5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: verdeNeon,
                width: 2.75,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
