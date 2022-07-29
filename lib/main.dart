import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/screens/login_screen.dart';
import 'package:quiz_app/screens/mental_health_screen.dart';
import 'package:quiz_app/screens/learn_more/mental_health.dart';
import 'package:quiz_app/constants.dart';

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
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFffffff),
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/',
      routes:  <String, WidgetBuilder> {
        '/': (context) => const HomeScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/mental_health_home': (BuildContext context) => new MentalHealthScreen(),
        '/learn_more_mental_health': (BuildContext context) => new LearnMoreMentalScreen(),
        '/phq_home': (BuildContext context) => new WelcomeScreen(),
        // '/gad_home': (BuildContext context) => new GADScreen(),
        // '/cbt_home': (BuildContext context) => new CBTScreen(),
        // '/diaphragm_home': (BuildContext context) => new DiaphragmScreen(),
        // '/meditation_home': (BuildContext context) => new MeditationScreen(),
        // '/mindfulness_home': (BuildContext context) => new MindfulnessScreen(),
      },
    );
  }
}
