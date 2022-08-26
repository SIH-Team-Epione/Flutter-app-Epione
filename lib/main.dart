import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/doctor_consultation_screen.dart';
import 'package:quiz_app/screens/google_sign_in.dart';

import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/learn_more/benefits_physical.dart';
import 'package:quiz_app/screens/learn_more/comm_skills.dart';
import 'package:quiz_app/screens/learn_more/further_read_mental.dart';
import 'package:quiz_app/screens/learn_more/further_read_social.dart';
import 'package:quiz_app/screens/learn_more/learn_time.dart';
import 'package:quiz_app/screens/learn_more/social_health.dart';
import 'package:quiz_app/screens/social_health/contacts.dart';
import 'package:quiz_app/screens/social_health/index.dart';
import 'package:quiz_app/screens/work_health/shared_exp.dart';
import 'package:quiz_app/screens/work_health/time_techniques.dart';
import 'package:quiz_app/screens/learn_more/work_health.dart';
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
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_screen2.dart';
import 'package:quiz_app/screens/signing_up.dart';
import 'package:quiz_app/screens/social_health/connect_family.dart';
import 'package:quiz_app/screens/social_health/connect_friends.dart';
import 'package:quiz_app/screens/social_health/social_health_screen.dart';
import 'package:quiz_app/screens/work_health/concentration_home.dart';
import 'package:quiz_app/screens/work_health/pomodoro.dart';
import 'package:quiz_app/screens/work_health/work_health_screen.dart';

import 'controllers/question_controller_phq.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //     apiKey: 'AIzaSyCof7TFo6DH-cHndhmCKfcPTyjubQOoo4A',
      //     appId: '1:782675839270:android:f3318f5ac8bba2ade099e7',
      //     messagingSenderId: '782675839270',
      //     projectId: 'epione-992ee')
      );

  await Permission.camera.request();
  await Permission.microphone.request();
  await Permission.phone.request();
  await Permission.activityRecognition.request();
  await Permission.location.request();
  await Permission.sms.request();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: GetMaterialApp(
          title: 'Epione',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // TODO: change the color schemes
            primarySwatch: Colors.teal,
            scaffoldBackgroundColor: const Color(0xFFffffff),
            fontFamily: 'Montserrat',
          ),
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (context) => const HomePage(),
            '/login': (BuildContext context) => const LoginScreen(),
            '/learn_more_self_care': (BuildContext context) =>
                new LearnMoreSelfCare(),
            '/doctor_consultation': (BuildContext context) =>
                DoctorConsultationScreen(),

            '/mental_health_home': (BuildContext context) =>
                new MentalHealthScreen(),
            '/learn_more_mental_health': (BuildContext context) =>
                new LearnMoreMentalScreen(),
            '/phq_home': (BuildContext context) => new WelcomeScreen(),
            '/gad_home': (BuildContext context) => new GADScreen(),
            '/cbt_home': (BuildContext context) => new CBTScreen(),
            '/diaphragm_home': (BuildContext context) => new DiaphragmScreen(),
            '/meditation_home': (BuildContext context) =>
                new MeditationScreen(),
            '/mindfulness_home': (BuildContext context) =>
                new MindfulnessScreen(),

            '/further_read_mental': (BuildContext context) =>
                new FurtherReadMentalHealth(),

            '/physical_health_home': (BuildContext context) =>
                new PhysicalHealthScreen(),
            '/learn_more_physical_health': (BuildContext context) =>
                new LearnMorePhysicalScreen(),
            '/yoga': (BuildContext context) => new YogaScreen(),
            '/pmr': (BuildContext context) => new PMRScreen(),
            '/exercises': (BuildContext context) => new ExercisesScreen(),
            '/diets': (BuildContext context) => new DietsScreen(),
            '/benefits_physical': (BuildContext context) =>
                new BenefitsPhysical(),

            '/social_health_home': (BuildContext context) =>
                new SocialHealthScreen(),
            '/learn_more_social_health': (BuildContext context) =>
                new LearnMoreSocialScreen(),
            '/Contacts': (BuildContext context) => new Contacts(),
            '/index': (BuildContext context) => new IndexPage(),
            '/communication_skills': (BuildContext context) =>
                new CommunicationSkillsScreen(),
            '/more_social_health': (BuildContext context) =>
                new MoreSocialHealth(),

            '/work_health_home': (BuildContext context) =>
                new WorkHealthScreen(),
            '/learn_more_work_health': (BuildContext context) =>
                new LearnMoreWorkScreen(),
            //'/time_management_home': (BuildContext context) => new TimeHomeScreen(),
            '/learn_time': (BuildContext context) => new LearnTimeScreen(),
            '/pomodoro': (BuildContext context) => new PomodoroScreen(),
            '/concentration_home': (BuildContext context) =>
                new ConcentrationHomeScreen(),
            '/shared_exp': (BuildContext context) => new SharedExperiences(),
            //'/learn_conc': (BuildContext context) => new LearnConcScreen(),
          },
        ),
      );
}
