import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/google_sign_in.dart';

import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/learn_more/benefits_physical.dart';
import 'package:quiz_app/screens/login_screen.dart';
//importing mental health screens
import 'package:quiz_app/screens/mental_health/mental_health_screen.dart';
import 'package:quiz_app/screens/learn_more/mental_health.dart';
import 'package:quiz_app/screens/mental_health/cbt_screen.dart';
import 'package:quiz_app/screens/mental_health/diaphr_breathing.dart';
import 'package:quiz_app/screens/mental_health/meditation.dart';
import 'package:quiz_app/screens/mental_health/mindfulness.dart';
import 'package:quiz_app/screens/mental_health/phq9_home.dart';
import 'package:quiz_app/screens/mental_health/gad7_home.dart';
import 'package:quiz_app/constants.dart';
//importing physical health screens
import 'package:quiz_app/screens/physical_health/physical_health_screen.dart';
import 'package:quiz_app/screens/learn_more/physical_health.dart';
import 'package:quiz_app/screens/learn_more/self_care_home.dart';
import 'package:quiz_app/screens/physical_health/yoga.dart';
import 'package:quiz_app/screens/physical_health/yoga.dart';
import 'package:quiz_app/screens/physical_health/pmr.dart';
import 'package:quiz_app/screens/physical_health/diets.dart';
import 'package:quiz_app/screens/physical_health/exercises.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app/screens/signing_up.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
          child:
          GetMaterialApp(
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
              '/': (context) => const HomePage(),
              '/login': (BuildContext context) => const LoginScreen(),
              'learn_more_self_care': (BuildContext context) => new LearnMoreSelfCare(),

              '/mental_health_home': (BuildContext context) => new MentalHealthScreen(),
              '/learn_more_mental_health': (BuildContext context) => new LearnMoreMentalScreen(),
              '/phq_home': (BuildContext context) => new WelcomeScreen(),
              '/gad_home': (BuildContext context) => new GADScreen(),
              '/cbt_home': (BuildContext context) => new CBTScreen(),
              '/diaphragm_home': (BuildContext context) => new DiaphragmScreen(),
              '/meditation_home': (BuildContext context) => new MeditationScreen(),
              '/mindfulness_home': (BuildContext context) => new MindfulnessScreen(),

              '/physical_health_home': (BuildContext context) => new PhysicalHealthScreen(),
              '/learn_more_physical_health': (BuildContext context) => new LearnMorePhysicalScreen(),
              '/yoga': (BuildContext context) => new YogaScreen(),
              '/pmr': (BuildContext context) => new PMRScreen(),
              '/exercises': (BuildContext context) => new ExercisesScreen(),
              '/diets': (BuildContext context) => new DietsScreen(),
              '/benefits_physical': (BuildContext context) => new BenefitsPhysical(),

    },
  )
  );
}
