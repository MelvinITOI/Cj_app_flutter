import 'package:flutter/material.dart';
import 'package:cj_app/screens/login.dart';
import 'package:cj_app/helpers/app_style.constants.dart';
import 'package:permission_handler/permission_handler.dart';

// void main() => runApp(const MyApp());

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  await Permission.microphone.request();
  await Permission.camera.request();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CJ',
        theme: buildThemeData(),
        debugShowCheckedModeBanner: false,
        home: LoginScreen()); //const Layout());
  }
}
