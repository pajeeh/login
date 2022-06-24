// ignore_for_file: unused_import, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/colors/colors.dart';

class EsqueciPage extends StatefulWidget {
  const EsqueciPage({Key? key}) : super(key: key);

  @override
  State<EsqueciPage> createState() => _EsqueciPageState();
}

class _EsqueciPageState extends State<EsqueciPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "E-mail enviado",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: verde,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: const Text(
                  "Um e-mail foi enviado para você com instruções para redefinir sua senha.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: preto,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              actions: <Widget>[
                TextButton(
                  child: const Text("Ok",
                      style: TextStyle(
                        color: verde,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                e.message.toString(),
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: preto,
      appBar: AppBar(
        backgroundColor: verde,
        title: const Text(
          'Esqueci minha senha',
          style: TextStyle(
            color: preto,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 50,
              ),
              child: Text(
                'Digite seu email para recuperar a senha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: verdeHackerNeon,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Divider(
              color: verdeHackerNeon,
              thickness: 1,
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: TextFormField(
                controller: _emailController,
                cursorColor: verdeNeon,
                cursorWidth: 13,
                cursorHeight: 30,
                style: const TextStyle(
                  color: verdeNeon,
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: verdeNeon,
                  ),
                  labelText: 'Email',
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, preencha o campo de email';
                  }
                  return null;
                },
                onSaved: (val) {
                  _emailController.text = val!;
                },
              ),
            ),
            const Divider(
              color: verdeHackerNeon,
              thickness: 1,
              height: 50,
            ),
            MaterialButton(
              onPressed: passwordReset,
              color: verde,
              child: const Text(
                'Resetar senha',
                style: TextStyle(
                  color: preto,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
