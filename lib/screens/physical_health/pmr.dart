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
        ),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                height: 100.0,
                child: ListView.builder(
                  itemCount: Data.pmrmed.length,
                  itemBuilder: (_, i) {
                    return InkWell(
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
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 10,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  height: 90,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        Data.pmrimg[i],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(child: SizedBox(width: 30)),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(Data.pmrText[i]),
                                    SizedBox(height: 10),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffe0f4f0)),
                                      child: Text(
                                        "Watch",
                                        style: const TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    // return Container(
                    //   margin: EdgeInsets.all(10),
                    //   height: MediaQuery.of(context).size.height / 4,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage(
                    //         Data.pmrimg[i],
                    //       ),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    //   child: ListTile(
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => PmrVdPlayer(
                    //             path: Data.pmrmed[i],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // );
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
