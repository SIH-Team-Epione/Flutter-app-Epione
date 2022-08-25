import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/animations/FadeAnimation.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/Quotes.dart';
import 'package:quiz_app/screens/doctor_consultation_screen.dart';
import 'package:quiz_app/screens/google_sign_in.dart';
import 'package:quiz_app/screens/hamburger_menu.dart';
import 'package:quiz_app/util/long_img_container.dart';
import 'package:quiz_app/screens/chatbot/main.dart';
import 'SOS.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    print(user);

    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

    void gotoDoctorsListPage(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorConsultationScreen()));
    }

    final firstDay = DateTime(2022, 8, 21);
    final dateNow = DateTime.now();
    final difference = daysBetween(firstDay, dateNow)%15;
    print(difference);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi '+ user!.displayName!+"!",
        style: TextStyle(
          fontSize: 14,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              user!.photoURL!,
            ),
          ),)
        ],
      ),
      drawer: NavBar(),
      body: Container(
        margin: EdgeInsets.only(top: 4),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Custom Appbar
            // Container(
            //   margin: EdgeInsets.only(left: 16, right: 16, top: 5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       GestureDetector(onTap:() {
            //         print('Drawer Tapped!');
            //       },
            //           child: SvgPicture.asset('assets/svg/drawer_icon2.svg')),
            //       Text('Hi '+ user!.displayName!.split(' ')[0] + '!'),
            //       TextButton(
            //           onPressed: (){
            //             final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            //             provider.logout();
            //           },
            //           child: Text('Logout')
            //       ),
            //       CircleAvatar(
            //         radius: 20,
            //         backgroundImage: NetworkImage(user.photoURL!),
            //       ),
            //       // Container(
            //       //   height: 45,
            //       //   width: 45,
            //         // decoration: BoxDecoration(
            //         //   borderRadius: BorderRadius.circular(20),
            //         //   image: DecorationImage(image: AssetImage('assets/images/user_image.png'))
            //         // ),
            //       // )
            //     ],
            //   ),
            // ),
            // card section
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text('Thought for the day',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: kBlackColor
                  ),),
                  SizedBox(height: 1,),
                  Text('We focus on one positive thought a day',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[400],
                  ),),
                  SizedBox(height: 2,),
                ],
              ),
            ),
            Container(
              height: 200,
              alignment: Alignment.center,
              margin: EdgeInsets.all(12),
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          image: AssetImage("assets/images/home_quote_img.jpg",),
                          fit: BoxFit.fill,
                        )
                      ),

                      ),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${sampled_quotes[difference]['quote']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                backgroundColor: Colors.white.withOpacity(0.2)
                              ),
                          ),
                        ),//${quotes[curr_index]}

                      ))
                ],
              ),
            ),
            SizedBox(height: 25,),

            // 2 button cards
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     // About self care button
            //     MyIconButton(
            //         iconImagePath: 'assets/images/about_self_care_icon.png',
            //         buttonText: 'Learn more about \n self care',
            //         bgColor: Color(0xffe0f4f0),
            //     ),
            //     GestureDetector(
            //       onTap: (){
            //         gotoDoctorsListPage();
            //       },
            //       child: MyIconButton(
            //           iconImagePath: 'assets/images/consult_doctor_icon.png',
            //           buttonText: 'Consult a mental health specialist',
            //           bgColor: Color(0xfff6d6d7),
            //       ),
            //     ),
            //
            //   ],
            // ),// Horizontal
            Container(
              height: 240,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/learn_more_self_care'),
                      child: FadeAnimation(
                          1.4,
                          verticalImageContainer('assets/images/self_care2.jpg', "Learn more about self care",
                              "5 minute read")),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/doctor_consultation'),
                      child: FadeAnimation(
                          1.5,
                          verticalImageContainer('assets/images/doctor_home2.jpg',
                              'Consult a mental health specialist', "In Delhi NCR")),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/pomodoro'),
                      child: FadeAnimation(
                          1.6,
                          verticalImageContainer('assets/images/time_home2.jpg', "Manage time using Pomodoro",
                              "Effective technique")),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/pmr'),
                      child: FadeAnimation(
                          1.5,
                          verticalImageContainer('assets/images/pmr_home2.jpg',
                              'Practice Progressive Muscle relaxation', "Releases strain")),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,

              ),
              child: RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/shared_exp');
                },
                child: Column(
                  children: [
                    Text('Shared Experiences'),
                    Text('Read posts and engage with others on their self-care journey'),
                  ],
                ),
              ),
            ),

            // Text widget for 'Explore Tracks'
            Padding(
              padding: EdgeInsets.only(top: 48, left: 32, right: 28),
              child: Text(
                'Explore Tracks',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000)
                ),
              ),
            ),
            SizedBox(height: 25,),

            // Tracks cards list
            Column(
              children: [
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/mental_health_home'),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 5, 25, 15.0),
                        height: 90.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 20,
                                spreadRadius: 10,
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(90, 25, 0, 0),
                                child: Container(
                                  //width:150,
                                  child: Text(
                                    'Mental Health',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                size: 30,
                                color: Colors.black,
                                ),
                              )
                              // Container(
                              //   width: 20,
                              //   height: 20,
                              //   decoration: BoxDecoration(
                              //     image: DecorationImage(
                              //       image: AssetImage("assets/images/home_right_arrow.png"),
                              //       fit: BoxFit.fill,
                              //     )
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 0,
                        bottom: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 90,
                              image: AssetImage('assets/images/home_mental.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/physical_health_home'),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 5, 25, 15.0),
                        height: 90.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 40,
                                spreadRadius: 10,
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(90, 25, 0, 0),
                                child: Container(
                                  //width:MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Physical Health',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 30,
                                  color: Color(0xff000000),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 0,
                        bottom: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 90,
                              image: AssetImage('assets/images/home_physical.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/social_health_home'),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 5, 25, 15.0),
                        height: 90.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 40,
                                spreadRadius: 10,
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(90, 25, 0, 0),
                                child: Container(
                                  //width:150,
                                  child: Text(
                                    'Social Health',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 30,
                                  color: Color(0xff000000),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 0,
                        bottom: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 90,
                              image: AssetImage('assets/images/home_social.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/work_health_home'),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 5, 25, 15.0),
                        height: 90.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 40,
                                spreadRadius: 10,
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(90, 25, 0, 0),
                                child: Container(
                                  //width:150,
                                  child: Text(
                                    'Work Health',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 30,
                                  color: Color(0xff000000),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 0,
                        bottom: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 90,
                              image: AssetImage('assets/images/home_work.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25,),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          buildChatbotButton(),
          SizedBox(height: 5.0,),
          buildSOSButton()
        ]
      ),
    );
  }
  Widget buildChatbotButton() => Container(
    margin: EdgeInsets.only(right: 8.0, bottom: 8.0),
    width: 65.0,
    height: 65.0,
    decoration: BoxDecoration(
      // boxShadow: [
      //   BoxShadow(
      //       color: Color(0xFFBDBDBD),
      //       offset: const Offset(2.0, 2.0),
      //       blurRadius: 10.0,
      //       spreadRadius: 0.5
      //   )
      // ]
    ),
    child: FloatingActionButton(
        backgroundColor: Color(0xFF307473),
            child: Icon(
              Icons.chat,
              size: 28.0,
            ),
        onPressed: () {
          print('Clicked');
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Chatbot()),
          );
        }
    ),
  );

  Widget buildSOSButton() => Container(
    margin: EdgeInsets.only(right: 8.0, bottom: 8.0),
    width: 65.0,
    height: 65.0,
    child: FloatingActionButton(
        backgroundColor: Colors.red.shade400,
        child: Text(
          'SOS'
        ),
        onPressed: () {
          print('Clicked');
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SOS()),
          );
        }
    ),
  );
}


