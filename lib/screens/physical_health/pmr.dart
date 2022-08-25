import 'package:flutter/material.dart';
import 'package:quiz_app/util/videoPlayer.dart';
import 'package:quiz_app/util/data.dart' as Data;

class PMRScreen extends StatefulWidget {
  const PMRScreen({Key? key}) : super(key: key);

  @override
  State<PMRScreen> createState() => _PMRScreenState();
}

class _PMRScreenState extends State<PMRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Progressive Muscle Relaxation',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFF000000),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        backgroundColor: Color(0xFFfafafa),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'What is PMR?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Progressive muscle relaxation (PMR) is a deep \nrelaxation technique that has been effectively \nused to control stress and anxiety, relieve insomnia, and \nreduce symptoms of certain types of chronic pain.\nProgressive muscle relaxation is based upon the simple \npractice of tensing, or tightening, one muscle group at \na time followed by a relaxation phase with release \nof the tension. ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pmr.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 1,
            ),
            Expanded(
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  itemCount: Data.pmrimg.length,
                  itemBuilder: (_, i) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Data.pmrimg[i],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ListTile(
                        title: Container(
                          child: Text(
                            Data.pmrText[i],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PmrVdPlayer(path: Data.pmrmed[i]),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
