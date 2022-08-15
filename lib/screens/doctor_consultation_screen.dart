import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/Doctors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/Quotes.dart';
import 'package:quiz_app/screens/doctor_details_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/util/my_button_icon_card.dart';

class DoctorConsultationScreen extends StatefulWidget {
  const DoctorConsultationScreen({Key? key}) : super(key: key);

  @override
  State<DoctorConsultationScreen> createState() => _DoctorConsultationScreenState();
}

class _DoctorConsultationScreenState extends State<DoctorConsultationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Consultation"),
      ),
      body: DoctorsListSection(),
    );
  }
}

class DoctorsListSection extends StatefulWidget {
  const DoctorsListSection({Key? key}) : super(key: key);

  @override
  State<DoctorsListSection> createState() => _DoctorsListSectionState();
}

class _DoctorsListSectionState extends State<DoctorsListSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: _buildDoctorRow(index, context),
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}

Widget _buildDoctorRow(int index, BuildContext context) {
  void gotoDoctorDetailsPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorDetailsScreen(index: index),
        ));
  }

  return GestureDetector(
    onTap: () {
      gotoDoctorDetailsPage(context);
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade50,
            blurRadius: 10,
            spreadRadius: 5,
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/user_image.png'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    child: Text(
                      doctors[index].name,
                      style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
                    child: Text(
                      "Specialisation: ${doctors[index].specialisation}",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
                    child: Text(
                      "Experience: ${doctors[index].yearsOfExp}",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
