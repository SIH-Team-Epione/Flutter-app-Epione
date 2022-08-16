import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:quiz_app/models/Doctors.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorDetailsScreen extends StatefulWidget {
  final int index;

  const DoctorDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Details"),
      ),
      body: Container(
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
              child: Text(
                doctors[widget.index].name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: Text("Hospital"),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: Text("Years of exp"),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: Text("Specialisation"),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: Text(
                          doctors[widget.index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: Text(
                          doctors[widget.index].yearsOfExp.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: Text(
                          doctors[widget.index].specialisation,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButtonColumn(Colors.teal.shade900, Icons.call, 'Call', 0),
                  _buildButtonColumn(Colors.teal.shade900, Icons.mail, 'Email', 1),
                  _buildButtonColumn(Colors.teal.shade900, Icons.language, 'Website', 2),
                  _buildButtonColumn(Colors.teal.shade900, Icons.location_on, 'Map', 3),
                ],
              ),
            )
          ],
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
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
              ),
              padding: EdgeInsets.all(12.0),
              child: Icon(icon, size: 30, color: color,),
            ),
          ],
        ),
      ),
    );
  }
}
