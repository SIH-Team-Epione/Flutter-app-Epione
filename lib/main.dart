import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'package:quiz_app/screens/mental_health_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Epione',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // TODO: change the color schemes
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes:  <String, WidgetBuilder> {
        '/': (context) => const HomeScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/welcome': (BuildContext context) => new WelcomeScreen(),
      },
    );
  }
}
