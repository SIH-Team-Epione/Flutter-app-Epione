import 'package:flutter/material.dart';
import 'chat.dart';

void main() {
  runApp(MaterialApp(
    home: Chatbot(),
  ));
}

class Chatbot extends StatelessWidget {
  const Chatbot({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
            iconTheme: IconThemeData(
              color: Colors.black
            ),
            // backgroundColor: Color(0xFF85F4FF),
            backgroundColor: Color(0xFFFEBD40),
          title: Row(
            children: <Widget> [
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(
              //       Icons.menu,
              //       color: Color(0xFF293241)
              //   ),
              // ),
              Expanded(
                flex: 7,
                child: const Text(
                  'Chatbot',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    // letterSpacing: 1.05
                    color: Colors.black
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
                        color: Color(0xFF293241)
                    ),
                ),
              )
            ],
          ),
        ),
        body: Container(
          color: Color(0xFFFAFAFA),
          child: Center(child: Chat()),
        ),
      ),
    );
  }
}