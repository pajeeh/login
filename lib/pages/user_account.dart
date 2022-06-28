import 'package:cloud_firestore/cloud_firestore.dart';
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

  List<String> docIDs = [];

  Future getDocIDs() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: preto,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Minha Conta',
          style: TextStyle(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //ID
            Text(
              'ID: ${user!.uid}',
              style: const TextStyle(
                color: verde,
                fontSize: 18,
                fontFamily: 'CourierNew',
                letterSpacing: 1.75,
                fontWeight: FontWeight.w700,
              ),
            ),
            //nome
            Text(
              'Nome: ${user!.displayName}',
              style: const TextStyle(
                color: verde,
                fontSize: 18,
                fontFamily: 'CourierNew',
                letterSpacing: 1.75,
                fontWeight: FontWeight.w700,
              ),
            ),
            //email
            Text(
              'Email: ${user!.email}',
              style: const TextStyle(
                color: verde,
                fontSize: 18,
                fontFamily: 'CourierNew',
                letterSpacing: 1.75,
                fontWeight: FontWeight.w700,
              ),
            ),
            //username
            Text(
              'Username: ${user!.displayName}',
              style: const TextStyle(
                color: verde,
                fontSize: 18,
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
