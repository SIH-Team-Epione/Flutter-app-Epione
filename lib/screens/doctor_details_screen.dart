import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/Doctors.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quiz_app/models/Quotes.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/util/my_button_icon_card.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final int index;

  const DoctorDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() =>
      _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Details"),
      ),
      body: Container(
        color: Colors.black12,
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user_image.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Text(doctors[widget.index].name)),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Hospital"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Years of exp"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Specialisation"),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(doctors[widget.index].name),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(doctors[widget.index].yearsOfExp.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(doctors[widget.index].specialisation),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.deepOrange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildButtonColumn(Colors.blue, Icons.call, 'Call', 0),
                    _buildButtonColumn(Colors.blue, Icons.mail, 'Email', 1),
                    _buildButtonColumn(Colors.blue, Icons.language, 'Website', 2),
                    _buildButtonColumn(Colors.blue, Icons.location_on, 'Map', 3),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildButtonColumn(
      Color color, IconData icon, String label, int position) {
    Future<void> itemClickHandler(int position) async {
      switch (position) {
        case 0:
          {
            //call
            final url = Uri.parse('tel://7055781339');
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              throw 'Could not launch';
            }
            break;
          }
        case 1:
          {
            //send mail
            final Email sendEmail = Email(
              body: 'body of email',
              subject: 'subject of email',
              recipients: ['xpandeyed@gmail.com'],
              isHTML: false,
            );

            await FlutterEmailSender.send(sendEmail);
            break;
          }
        case 2:
          {
            //website
            final url = Uri.parse('https://github.com');
            if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
              throw 'Could not launch';
            }

            break;
          }
        case 3:
          {
            //maps
            MapsLauncher.launchCoordinates(
                28.65495318711065, 77.23944576717803);
            break;
          }
      }
    }
    return GestureDetector(
      onTap: () {
        itemClickHandler(position);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}