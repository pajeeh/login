import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/user_account.dart';

import '../colors/colors.dart';
import '../content/infos.dart';
import 'about.dart';

class DefaultHomePage extends StatefulWidget {
  const DefaultHomePage({Key? key}) : super(key: key);

  @override
  State<DefaultHomePage> createState() => _DefaultHomePageState();
}

class _DefaultHomePageState extends State<DefaultHomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const DeviceIp(),
      appBar: AppBar(
        title: const Text(
          'Main Menu',
          style: TextStyle(
            color: preto,
            fontSize: 23,
            fontFamily: 'CourierNew',
            letterSpacing: 1.75,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: verde,
      ),
      drawer: Drawer(
        backgroundColor: preto,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: verdeNeon,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'INFORMAÇÕES',
                    style: TextStyle(
                      color: preto,
                      fontSize: 22,
                      fontFamily: 'CourierNew',
                      letterSpacing: 1.75,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Divider(
                    color: preto,
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: preto,
                      ),
                      Text(
                        user!.email!,
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
                ],
              ),
            ),
            ListTile(
              title: const Text('Minha Conta',
                  style: TextStyle(
                    color: verdeHacker,
                    fontSize: 20,
                    fontFamily: 'CourierNew',
                    letterSpacing: 1.75,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserAccountPage(),
                  ),
                );
              },
            ),
            const Divider(
              color: verde,
              thickness: 1,
              height: 50,
            ),
            ListTile(
              title: const Text('Logout',
                  style: TextStyle(
                    color: vermelhoNeon,
                    fontSize: 20,
                    fontFamily: 'CourierNew',
                    letterSpacing: 1.75,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            const Divider(
              color: transparente,
              height: 200,
            ),
            SizedBox(
              height: 1,
              child: Container(color: verdeNeon),
            ),
            ListTile(
              title: const Text('Sobre os Devs',
                  style: TextStyle(
                    color: verdeHacker,
                    fontSize: 20,
                    fontFamily: 'CourierNew',
                    letterSpacing: 1.75,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutDevs(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Sobre App Login',
                  style: TextStyle(
                    color: verdeHacker,
                    fontSize: 20,
                    fontFamily: 'CourierNew',
                    letterSpacing: 1.75,
                    fontWeight: FontWeight.w600,
                  )),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Networkinfo extends StatefulWidget {
  const Networkinfo({Key? key}) : super(key: key);

  @override
  State<Networkinfo> createState() => _NetworkinfoState();
}

class _NetworkinfoState extends State<Networkinfo> {
  @override
  Widget build(BuildContext context) {
    return const DeviceIp();
  }
}
