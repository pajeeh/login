import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Text('Minha Conta',
        style:  TextStyle(
            color: preto,
            fontSize: 25,
            fontFamily: 'CourierNew',
            letterSpacing: 1.75,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nome: ${user!.displayName}',
              style: const TextStyle(
                color: preto,
                fontSize: 20,
                fontFamily: 'CourierNew',
                letterSpacing: 1.75,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
