import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/pages/home_page.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../colors/colors.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({Key? key}) : super(key: key);

  static const styleAbout = TextStyle(
    color: verdeNeon,
    fontSize: 18,
    fontFamily: 'CourierNew',
    letterSpacing: 0.010,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: preto,
        appBar: AppBar(
          elevation: 10,
          backgroundColor: preto,
          centerTitle: true,
          title: const Text(
            'ABOUT App Login',
            style: TextStyle(
              color: verdeNeon,
              fontSize: 28,
              fontFamily: 'CourierNew',
              letterSpacing: 5.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Divider(
                    color: verdeNeon,
                    thickness: 2,
                  ),
                  Divider(color: transparente, height: 25),
                  Text('README',
                      style: TextStyle(
                        color: verdeNeon,
                        fontSize: 25,
                        fontFamily: 'CourierNew',
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              const AutoSizeText(
                'Este projeto é apenas uma introdução à programação para dispositivos móveis, podendo servir de base para projetos futuros.',
                
                style: TextStyle(fontSize: 20.0),
                maxLines: 12,
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Material(
                  color: vermelho,
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DefaultHomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      'VOLTAR',
                      style: TextStyle(
                        color: preto,
                        fontSize: 36,
                        //shadows: shadowsWhite,
                        fontFamily: 'CourierNew',
                        letterSpacing: 1.25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
