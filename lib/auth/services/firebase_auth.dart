// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

/* Métodos: 
// createUserWithEmailAndPassword,
// signInWithEmailAndPassword,
// logOut
*/

/* Método signUpWithEmailAndPassword:
  Parámetros: name, username, email, password
*/
  Future cadastro(
      {required String name,
      required String username,
      required String email,
      required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc('Users Data')
          .set({
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'uid': user?.uid,
      });
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

/* Método signInWithEmailAndPassword deve permitir o usuário fazer login com 
*  nome de usuário e senha.
*/
  Future logIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

/* Método signOut deve permitir o usuário fazer logout.*/
  Future logOut() async {
    try {
      await _auth.signOut();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}

// MODELO BASE
/*
Future<void> userSetup(String displayName) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid = auth.currentUser?.uid.toString();
  users.add({'displayName': displayName, 'uid': uid});
  return;
}
*/
