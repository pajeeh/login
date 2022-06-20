// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:login/auth/pages/cadastro_page.dart';
import 'package:login/auth/pages/home.dart';
import 'package:login/auth/services/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          const SizedBox(height: 80),
          // logo
          Column(
            children: const [
              FlutterLogo(
                size: 55,
              ),
              SizedBox(height: 50),
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),

          const SizedBox(
            height: 50,
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: LoginForm(),
          ),

          const SizedBox(height: 20),

          Row(
            children: <Widget>[
              const SizedBox(width: 30),
              const Text('New here ? ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/signup');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CadastroPage()));
                },
                child: const Text('Get Registered Now!!',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          const SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  FirebaseAuthService()
                      .logIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
