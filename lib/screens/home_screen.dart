import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/Quotes.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/util/my_button_icon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

    final firstDay = DateTime(2022, 7, 27);
    final dateNow = DateTime.now();
    final difference = daysBetween(firstDay, dateNow);
    print(difference);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home"),
      //   centerTitle: true,
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Custom Appbar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(onTap:() {
                    print('Drawer Tapped!');
                  },
                      child: SvgPicture.asset('assets/svg/drawer_icon2.svg')),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: AssetImage('assets/images/user_image.png'))
                    ),
                  )
                ],
              ),
            ),
            // card section
            SizedBox(
              height: 25,
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
                        child: Text('${sampled_quotes[difference]['quote']}',
                          style: TextStyle(color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              backgroundColor: Colors.white.withOpacity(0.2)
                            ),
                        ),//${quotes[curr_index]}

                      ))
                ],
              ),
            ),
            SizedBox(height: 25,),

            // 2 button cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // About self care button
                MyIconButton(
                    iconImagePath: 'assets/images/about_self_care_icon.png',
                    buttonText: 'Learn more about \n self care',
                    bgColor: Color(0xffe0f4f0),
                ),
                MyIconButton(
                    iconImagePath: 'assets/images/consult_doctor_icon.png',
                    buttonText: 'Consult a mental health specialist',
                    bgColor: Color(0xfff6d6d7),
                ),

              ],
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
                                padding: const EdgeInsets.fromLTRB(110, 25, 0, 0),
                                child: Container(
                                  width:150,
                                  child: Text(
                                    'Mental Health',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                                child: Icon(
                                    Icons.arrow_circle_right_rounded,
                                size: 40,
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
                              width: 110,
                              image: AssetImage('assets/images/home_mental.png'),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
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
                              padding: const EdgeInsets.fromLTRB(110, 25, 0, 0),
                              child: Container(
                                width:150,
                                child: Text(
                                  'Physical Health',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                              child: Icon(
                                Icons.arrow_circle_right_rounded,
                                size: 40,
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
                            width: 110,
                            image: AssetImage('assets/images/home_physical.png'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ],
                ),
                Stack(
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
                              padding: const EdgeInsets.fromLTRB(110, 25, 0, 0),
                              child: Container(
                                width:150,
                                child: Text(
                                  'Social Health',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                              child: Icon(
                                Icons.arrow_circle_right_rounded,
                                size: 40,
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
                            width: 110,
                            image: AssetImage('assets/images/home_social.png'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ],
                ),
                Stack(
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
                              padding: const EdgeInsets.fromLTRB(110, 25, 0, 0),
                              child: Container(
                                width:150,
                                child: Text(
                                  'Work Health',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 10,0),
                              child: Icon(
                                Icons.arrow_circle_right_rounded,
                                size: 40,
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
                            width: 110,
                            image: AssetImage('assets/images/home_work.png'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5,),
              ],
            )
          ],
        ),
      )
    );
  }
}

