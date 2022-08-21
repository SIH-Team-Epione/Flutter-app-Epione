import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';

class MyIconButton extends StatelessWidget {

  final String iconImagePath;
  final String buttonText;
  final Color bgColor;

  const MyIconButton({
    Key? key,
    required this.iconImagePath,
    required this.buttonText,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // icon
        Container(
          height: 160,
          width: 150,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 20,
                  spreadRadius: 10,
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(iconImagePath,
                height: 70,),
              ),
              SizedBox(height: 4,),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: bgColor,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
        // text
      ],
    );
  }
}
