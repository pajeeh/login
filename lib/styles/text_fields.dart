import 'package:flutter/material.dart';
import 'package:login/colors/colors.dart';

class Username extends StatefulWidget {
  Username({Key? key}) : super(key: key);
  
  final TextEditingController usernameController = TextEditingController();

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  get usernameController => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.1,
        child: TextField(
          controller: usernameController,
          cursorColor: verdeNeon,
          cursorWidth: 13,
          cursorHeight: 30,
          style: const TextStyle(
            color: verdeClaro,
            fontSize: 25,
            fontFamily: 'CourierNew',
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
          
          decoration: const InputDecoration(
            icon: Icon(
              Icons.person,
              size: 30,
              color: verdeNeon,
            ),
            labelText: 'Username',
            labelStyle: TextStyle(
              color: verde,
              fontSize: 21,
              fontFamily: 'CourierNew',
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: verdeMuitoEscuro, width: 5),
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
