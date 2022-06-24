import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors/colors.dart';
import 'private/auth/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Courier New',
        scaffoldBackgroundColor: branco,
      ),
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
