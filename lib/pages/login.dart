import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/colors/colors.dart';
import 'package:login/pages/reset_pass.dart';

import '../components/skull.dart';
import '../components/text_bottom.dart';
import '../components/text_top.dart';

class StatefulLoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const StatefulLoginPage({Key? key, required this.showRegisterPage})
      : super(key: key);

  @override
  State<StatefulLoginPage> createState() => _StatefulLoginPageState();
}

class _StatefulLoginPageState extends State<StatefulLoginPage> {
  final shadowsWhite = [
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Colors.white,
        blurRadius: 0.5),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Color.fromARGB(230, 0, 143, 0),
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
  final shadowsBlue = [
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Color.fromARGB(255, 0, 255, 42),
        blurRadius: 1.5),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Color.fromARGB(193, 0, 0, 0),
        blurRadius: .5),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Color.fromARGB(255, 0, 255, 42),
        blurRadius: .5),
  ];
  final shadowsGreen = [
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Colors.white,
        blurRadius: 0.5),
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Color.fromARGB(230, 0, 143, 0),
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
  final shadowsRed = [
    const Shadow(
        // bottomLeft
        offset: Offset(0, 0),
        color: Color.fromARGB(255, 255, 128, 128),
        blurRadius: 0),
  ];

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: preto,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TopText(),
                    const Divider(
                      color: transparente,
                    ),
                    const Skull(),
                    const Divider(
                      color: transparente,
                    ),
                    TextFormField(
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
                    const Divider(
                      color: transparente,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      cursorColor: verdeNeon,
                      cursorWidth: 13,
                      cursorHeight: 30,
                      obscureText: true,
                      obscuringCharacter: '\u2731',
                      style: const TextStyle(
                        color: verdeClaro,
                        fontSize: 25,
                        fontFamily: 'CourierNew',
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Não pode ser vazio';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        _passwordController.text = val!;
                      },
                    ),
                    const Divider(
                      color: transparente,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: Material(
                        color: verdeNeon,
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              signIn();
                            }
                          },
                          /*if (_emailController.text.trim().isNotEmpty &&
                              _passwordController.text.trim().isNotEmpty) {
                            signIn();
                          }
                        },*/
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          minWidth: size.width * 0.4,
                          height: size.height * 0.07,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: preto,
                              fontSize: 32,
                              shadows: shadowsGreen,
                              fontFamily: 'CourierNew',
                              letterSpacing: 1.25,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: transparente,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextButton(
                              onPressed: widget.showRegisterPage,
                              child: Text(
                                'Cadastrar-se',
                                style: TextStyle(
                                  color: azulNeon,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'CourierNew',
                                  shadows: shadowsBlue,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 180,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const EsqueciPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Esqueci a senha',
                                style: TextStyle(
                                  color: vermelho,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'CourierNew',
                                  shadows: shadowsRed,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 50,
                      color: transparente,
                    ),
                    BottomText(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
