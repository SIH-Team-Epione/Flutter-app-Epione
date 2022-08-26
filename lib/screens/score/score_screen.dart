import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/controllers/question_controller_phq.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/models/ReportCategoriesPHQ.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    QuestionController _qnController = Get.put(QuestionController());
    final score = _qnController.numOfCorrectAns;
    final catId;
    final doc;
    if(score<=4){
      catId=0;
      doc=false;
    }
    else if(score>=5 && score<=9){
      catId=1;
      doc=false;
    }
    else if(score>=10 && score<=14){
      catId=2;
      doc=true;
    }
    else if(score>=15 && score<=19){
      catId=3;
      doc=true;
    }
    else {
      catId=4;
      doc=true;
    }

    final double padding = 25;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: Image.asset('assets/images/report_bg.png'),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 190),
                Padding(
                    padding:const EdgeInsets.symmetric(horizontal:16.0),
                child: Column(
                  children: [
                    Text(
                      'REPORT',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Score: $score/27",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),),
                const SizedBox(height: 20),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: DataTable(
                          columns: [
                            DataColumn(
                              label: Text(
                                "Label",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Value",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                          rows: [
                            DataRow(
                                cells: [
                                  DataCell(Text('Name')),
                                  DataCell(Text(user!.displayName!)),
                                ]
                            ),
                            DataRow(
                                cells: [
                                  DataCell(Text('Score')),
                                  DataCell(Text("$score/27")),
                                ]
                            ),
                            DataRow(
                                cells: [
                                  DataCell(Text('Range')),
                                  DataCell(Text(catsList[catId].range)),
                                ]
                            ),
                            DataRow(
                                cells: [
                                  DataCell(Text('Severity')),
                                  DataCell(Text(catsList[catId].depressionSeverity)),
                                ]
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:16.0),
                          child: Column(
                            children: [
                              Text(
                                  'Proposed Treatment Action',
                              style: TextStyle(
                                fontWeight: FontWeight.w700
                              ),),
                              SizedBox(height: 10,),
                              Text(catsList[catId].treatmentAction,),
                              // ButtonWidget(
                              //   text: "Download report",
                              //   onClicked: () async {
                              //     final date = DateTime.now();
                              //     final dueDate = date.add(Duration(days: ));
                              //     final invoice = Invoice(
                              //       supplier: Supplier(
                              //         name: 'Sarah Field',
                              //         email: '123@gmail'
                              //       )
                              //       info: InvoiceInfo(
                              //         date: date,
                              //         dueDate: dueDate,
                              //         description: 'My desc...',
                              //           number: '${DateTime.now().year}-9999' ),
                              //     items: [
                              //       InvoiceItem(
                              //     description: 'coffee',
                              //     date: DateTime.now(),
                              //     quantity: 3,
                              //     vat: 0.19
                              //     ),
                              //     InvoiceItem(
                              //     description: 'coffee',
                              //     date: DateTime.now(),
                              //     quantity: 3,
                              //     vat: 0.19
                              //     ),
                              //
                              //     ]
                              //     );
                              //     final pdfFile = await PdfInvoiceApi.generate(invoice);
                              //
                              //     PdfApi.openFile(pdfFile);
                              //   }
                              // ),
                              SizedBox(height: 20,),
                              Text(
                                'Suggested Features',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              if(doc)
                                InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/doctor_consultation');
                                  },
                                  highlightColor: Color(0xffe0f4f0),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    height: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                                          .1,
                                          .9
                                        ], colors: [
                                        Colors.black.withOpacity(.5),
                                        Colors.black.withOpacity(.1),
                                        ]),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                            image: AssetImage('assets/images/doctor_home2.jpg')),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 12,
                                          spreadRadius: 5,
                                        )
                                        ]
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            'For this score range we recommend you contact a doctor. You can easily find one through our doctor consultation feature.',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                ),

                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: catsList[catId].listMental.length,
                                  itemBuilder: (context, index) {
                                  final feature = catsList[catId].listMental[index];

                                  return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(context, feature.nextScreenRoute);
                                      },
                                      highlightColor: Color(0xffe0f4f0),
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
                                        height: 90,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(0),
                                            color: Colors.white,
                                            boxShadow: [BoxShadow(
                                              color: Colors.grey.shade200,
                                              blurRadius: 12,
                                              spreadRadius: 5,
                                            )]
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 1,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(0.0),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(50),
                                                    child: Image.asset(
                                                      feature.urlImage,
                                                      fit: BoxFit.cover,
                                                      height:80,
                                                    ),
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
                                                      ],
                                                    ),
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                  );
                                  }
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: catsList[catId].listPhysical.length,
                                  itemBuilder: (context, index) {
                                    final feature = catsList[catId].listPhysical[index];

                                    return InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context, feature.nextScreenRoute);
                                        },
                                        highlightColor: Color(0xffe0f4f0),
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
                                          height: 90,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(0),
                                              color: Colors.white,
                                              boxShadow: [BoxShadow(
                                                color: Colors.grey.shade200,
                                                blurRadius: 12,
                                                spreadRadius: 5,
                                              )]
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(50),
                                                      child: Image.asset(
                                                        feature.urlImage,
                                                        fit: BoxFit.cover,
                                                        height:80,
                                                      ),
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
                                                        ],
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                    );
                                  }
                              ),
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: catsList[catId].listSocial.length,
                                  itemBuilder: (context, index) {
                                    final feature = catsList[catId].listSocial[index];

                                    return InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context, feature.nextScreenRoute);
                                        },
                                        highlightColor: Color(0xffe0f4f0),
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
                                          height: 90,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(0),
                                              color: Colors.white,
                                              boxShadow: [BoxShadow(
                                                color: Colors.grey.shade200,
                                                blurRadius: 12,
                                                spreadRadius: 5,
                                              )]
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(50),
                                                      child: Image.asset(
                                                        feature.urlImage,
                                                        fit: BoxFit.cover,
                                                        height:80,
                                                      ),
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
                                                        ],
                                                      ),
                                                    )
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                    );
                                  }
                              ),
                            ],
                          )
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }

//   static Future openFile(File file) async {
//     final url = file.path;
//     await OpenFile.open(url);
//   }
// }
//
//
//
// class Invoice {
 }
