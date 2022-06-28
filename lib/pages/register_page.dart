// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/main.dart';
import 'package:login/styles/text_fields.dart';

import '../colors/colors.dart';


class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  //String name, String username, String email, String password

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      )
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .set({
          'uid': user.uid,
          'name': _nameController.text.trim(),
          'username': _usernameController.text.trim(),
          'email': _emailController.text.trim(),
        });
      });
      return 'Sucesso';
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  final _formKey = GlobalKey<FormState>();

  final shadowsWhite = [
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Colors.white,
        blurRadius: 0.5),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Color.fromARGB(230, 255, 255, 255),
        blurRadius: 1.75),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 1),
        color: Color.fromARGB(255, 1, 102, 31),
        blurRadius: 0.15),
    const Shadow(
        // bottomLeft
        offset: Offset(0, -1),
        color: Color.fromARGB(230, 255, 255, 255),
        blurRadius: 5.75),
  ];

  String? email;
  String? password;
  String? name;
  String? username;
  bool agree = false;

  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return azulNeon;
      }
      return verdeNeon;
    }

    var border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(100.0),
      ),
    );

    var space = const Divider(height: 10);

    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: preto,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Divider(
                  color: transparente,
                  height: 5,
                ),
                const Center(
                  child: Text(
                    'Insira suas informações',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: verdeClaro,
                      fontSize: 22,
                      fontFamily: 'CourierNew',
                      letterSpacing: .5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Divider(
                  color: transparente,
                  height: 5,
                ),

                // Name
                TextFormField(
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
                    labelText: 'Name',
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
                        width: 1.75,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: verdeNeon,
                        width: 1.75,
                      ),
                    ),
                  ),
                  onSaved: (val) {
                    name = val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Não pode ser vazio';
                    }
                    return null;
                  },
                ),

                space,
                //Username
                TextFormField(
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
                      Icons.badge,
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
                      borderSide: BorderSide(
                        color: verdeMuitoEscuro,
                        width: 1.75,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: verdeNeon,
                        width: 1.75,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Não pode ser vazio';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    username = val;
                  },
                ),

                space,
                // Email
                TextFormField(
                  controller: _emailController,
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
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.email_rounded,
                      size: 30,
                      color: verdeNeon,
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: verde,
                      fontSize: 21,
                      fontFamily: 'CourierNew',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: verdeMuitoEscuro, width: 1.75),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: verdeNeon,
                        width: 1.75,
                      ),
                    ),
                    border: border,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Não pode ser vazio';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),

                space,
                // Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: '\u2731',
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
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_sharp,
                      size: 30,
                      color: verdeNeon,
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: verde,
                      fontSize: 21,
                      fontFamily: 'CourierNew',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: verdeMuitoEscuro,
                        width: 1.75,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: verdeNeon,
                        width: 1.75,
                      ),
                    ),
                    border: border,
                  ),
                  onSaved: (val) {
                    password = val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Não pode ser vazio';
                    }
                    return null;
                  },
                ),

                space,
                // Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  obscuringCharacter: '\u2731',
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
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.lock_sharp,
                      size: 30,
                      color: verdeNeon,
                    ),
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(
                      color: verde,
                      fontSize: 21,
                      fontFamily: 'CourierNew',
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: verdeMuitoEscuro,
                        width: 1.75,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: verdeNeon,
                        width: 1.75,
                      ),
                    ),
                    border: border,
                  ),
                  validator: (value) {
                    if (value != pass.text) {
                      return 'senhas não conferem';
                    }
                    return null;
                  },
                ),

                space,
                //====================================================
                Row(
                  children: <Widget>[
                    Checkbox(
                      checkColor: preto,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      onChanged: (_) {
                        setState(() {
                          agree = !agree;
                        });
                      },
                      value: agree,
                    ),
                    const Flexible(
                      child: Text(
                        'Aceito os termos e blá blá blá...',
                        maxLines: 2,
                        style: TextStyle(
                          color: verdeClaro,
                          fontSize: 18,
                          fontFamily: 'CourierNew',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const Divider(color: transparente, height: 15),

                // CadastroPage button
                SizedBox(
                  height: 40,
                  width: 240,
                  child: Material(
                    color: verdeNeon,
                    borderRadius: BorderRadius.circular(10),
                    child: MaterialButton(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      minWidth: size.width * 0.5,
                      height: size.height * 0.07,
                      onPressed: signUp,
                      child: Text(
                        'CADASTRAR',
                        style: TextStyle(
                          color: preto,
                          fontSize: 30,
                          shadows: shadowsWhite,
                          fontFamily: 'CourierNew',
                          letterSpacing: 1.25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),

                const Divider(color: transparente, height: 15),

                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: widget.showLoginPage,
                  child: const Text(
                    'VOLTAR',
                    style: TextStyle(
                      color: verdeNeon,
                      fontSize: 22,
                      fontFamily: 'CourierNew',
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
