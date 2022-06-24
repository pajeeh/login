import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/pages/home_page.dart';

import '../colors/colors.dart';

class AboutDevs extends StatelessWidget {
  const AboutDevs({Key? key}) : super(key: key);

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
            'ABOUT D3VS',
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
                  Text('O Hacker: Pajé',
                      style: TextStyle(
                        color: verdeNeon,
                        fontSize: 25,
                        fontFamily: 'CourierNew',
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              Image.asset(
                'assets/images/Hacker.jpg',
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment.centerLeft,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Divider(
                    color: verdeNeon,
                    thickness: 2,
                  ),
                  Text('O ScriptKiddie: Caio',
                      style: TextStyle(
                        color: verdeNeon,
                        fontSize: 25,
                        fontFamily: 'CourierNew',
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              Image.asset(
                'assets/images/ScriptKiddie.jpg',
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment.centerLeft,
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

// TODO Adicionar info sobre os devs

class AboutHacker extends StatelessWidget {
  const AboutHacker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AboutScriptKiddie extends StatelessWidget {
  const AboutScriptKiddie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
