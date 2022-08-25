import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:quiz_app/screens/mental_health/phq9_home.dart';
import 'package:quiz_app/models/MentalHealthHome.dart';

class MentalHealthScreen extends StatefulWidget {
  const MentalHealthScreen({Key? key}) : super(key: key);

  @override
  State<MentalHealthScreen> createState() => _MentalHealthScreenState();
}

// onPressed: () {
// Navigator.pushNamed(
// context, '/learn_more_mental_health');
// }

class _MentalHealthScreenState extends State<MentalHealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: new IconButton(
        //   icon: new Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: const Text(title),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade50,
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandableText(
                      learnMoreText,
                      expandText: "show more",
                      collapseText: "show less",
                      expandOnTextTap: true,
                      collapseOnTextTap: true,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context, '/learn_more_mental_health');
                        },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffe0f4f0)
                        ),
                        child: Text(
                          'Learn More',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Text('Features',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              SizedBox(
                height: 20,
              ),

              // List of features
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: featuresList.length,
                  itemBuilder: (context, index) {
                    final feature = featuresList[index];

                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, feature.nextScreenRoute);
                      },
                      highlightColor: Color(0xffe0f4f0),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 10,
                                spreadRadius: 10,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    feature.urlImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 0.0, 20.0, 0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          feature.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0)),
                                        ExpandableText(
                                          feature.description,
                                          expandText: 'show more',
                                          collapseText: 'show less',
                                          expandOnTextTap: true,
                                          collapseOnTextTap: true,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.0)),
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xffe0f4f0)),
                                          child: Text(
                                            feature.ageGroup,
                                            style:
                                                const TextStyle(fontSize: 10.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );

                    // return Card(
                    //   child: ListTile(
                    //     leading: Container(
                    //       height: 600,
                    //       child: Image.asset(
                    //         feature.urlImage,
                    //         fit: BoxFit.cover,
                    //         // height: 100,
                    //         // width: 300,
                    //       ),
                    //     ),
                    //     title: Text(feature.title),
                    //     subtitle: Text(feature.description),
                    //     trailing: const Icon(Icons.arrow_forward),
                    //   ),
                    // );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
