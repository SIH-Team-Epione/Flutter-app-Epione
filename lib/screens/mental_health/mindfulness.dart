import 'package:flutter/material.dart';
import 'package:quiz_app/util/data.dart' as Data;
import 'package:quiz_app/util/audio_file.dart';

class MindfulnessScreen extends StatefulWidget {
  const MindfulnessScreen({Key? key}) : super(key: key);

  @override
  State<MindfulnessScreen> createState() => _MindfulnessScreenState();
}

class _MindfulnessScreenState extends State<MindfulnessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Mindfulness',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 2,
                child: Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'What is Mindfulness?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      Flexible(
                        child: Text(
                          'Mindfulness is the basic human \nability to be fully present,\naware of where we are \nand what we are doing,\nand not overly reactive or \noverwhelmed by what is going \non around us.',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mindfulnessimg.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                    itemCount: Data.mindfulnessText.length,
                    itemBuilder: (_, i) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipOval(
                              child: Image.asset(
                                Data.mindfulnessimg[i],
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(Data.mindfulnessText[i]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioPlayerAsset(
                                    path: Data.mindfulnessTracks[i]),
                              ),
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(
                              0xFFf6d6d7,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
