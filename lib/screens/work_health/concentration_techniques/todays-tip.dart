import 'package:flutter/material.dart';
import '/models/Tips.dart';

class TodaysTip extends StatelessWidget {
  const TodaysTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      return (to.difference(from).inHours / 24).round();
    }

    final firstDay = DateTime(2022, 8, 20);
    final dateNow = DateTime.now();
    final difference = daysBetween(firstDay, dateNow) % concentration_tips.length;
    print(difference);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        // backgroundColor: Color(0xFF85F4FF),
        backgroundColor: Colors.teal,
        title: Row(
          children: <Widget> [
            Expanded(
              flex: 7,
              child: const Text(
                'Tip of the day',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    // letterSpacing: 1.05
                    color: Colors.white
                ),
              ),
            ),
            // SizedBox(width: MediaQuery.of(context).size.width / 3),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                    Icons.person,
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                //'assets/images/ocean.jpg',
                //'https://www.99images.com/download-image/869224/2880x2560',
                '${concentration_tips[difference]['imgUrl']}',
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height * 0.40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '${concentration_tips[difference]['title']}',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                '${concentration_tips[difference]['description']}',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
