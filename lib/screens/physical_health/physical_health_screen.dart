import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/MentalHealthHome.dart';

class PhysicalHealthScreen extends StatefulWidget {
  const PhysicalHealthScreen({Key? key}) : super(key: key);

  @override
  State<PhysicalHealthScreen> createState() => _PhysicalHealthScreenState();
}

class _PhysicalHealthScreenState extends State<PhysicalHealthScreen> {
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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: 350,
                height: 120,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/learn_more_physical_health');
                  },
                  highlightColor: Colors.greenAccent.withOpacity(0.3),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  color: Color(0xff307473),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 20
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 5,
                    ),
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(307473),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Text.rich(
                        TextSpan(
                            text: "Learn more\n",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                            ),
                            children: [
                              TextSpan(
                                  text: learnMoreText,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12
                                  )
                              )
                            ]
                        )
                    ),
                  ),
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
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 10,
                            spreadRadius: 10,
                          )]
                        ),
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
                                child:
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
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
                                      const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                                      Text(
                                        feature.description,
                                        style: const TextStyle(fontSize: 10.0,
                                        color: Color(0xff8e8e8e)),
                                      ),
                                      const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
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
                  }
              )
            ],
          ),
        ),

      ),
    );
  }
}


