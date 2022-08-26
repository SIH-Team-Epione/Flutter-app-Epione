import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:quiz_app/models/SocialHealthHome.dart';

class SocialHealthScreen extends StatefulWidget {
  const SocialHealthScreen({Key? key}) : super(key: key);

  @override
  State<SocialHealthScreen> createState() => _SocialHealthScreenState();
}

// onPressed: (){
// Navigator.pushNamed(context, '/learn_more_social_health');
// }

class _SocialHealthScreenState extends State<SocialHealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(title),
        // centerTitle: false,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
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
                            context, '/learn_more_social_health');
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
              SizedBox(height: 25,),
              Container(
                child: Text(
                  'Features',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  )
                ),
              ),
              SizedBox(height: 20,),

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
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            spreadRadius: 10,
                          )]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                  child: Image.asset(
                                    feature.urlImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child:
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      feature.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    ExpandableText(
                                      feature.description,
                                      collapseOnTextTap: true,
                                      expandText: 'show more',
                                      collapseText: 'show less',
                                      expandOnTextTap: true,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffe0f4f0)
                                      ),
                                      child: Text(
                                        feature.ageGroup,
                                        style: const TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),

      ),
    );
  }
}


