import 'package:expandable_text/expandable_text.dart';
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
        title: Text(
          'Progressive Muscle Relaxation',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFFfafafa),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'What is PMR?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        'Priogressive muscle relaxation (PMR) is a deep relaxation technique that has been effectively used to control stress and anxiety, relieve insomnia, and reduce symptoms of certain types of chronic pain. Progressive muscle relaxation is based upon the simple practice of tensing, or tightening, one muscle group at a time followed by a relaxation phase with release of the tension.',
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Expanded(
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  itemCount: Data.pmrmed.length,
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PmrVdPlayer(
                                path: Data.pmrmed[i],
                              ),
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
