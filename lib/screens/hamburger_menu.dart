import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'google_sign_in.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Color activeColor = Color(0xFFe0f4f0);
  Color inactiveColor = Color(0xFFfafafa);
  Color textColor = Color(0xFF000000);
  Color iconClr = Colors.teal;

  final user = FirebaseAuth.instance.currentUser;

  List<bool> selected_opt = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  set_opt(int i) {
    for (int k = 0; k < selected_opt.length; k++) {
      if (k == i)
        selected_opt[k] = true;
      else
        selected_opt[k] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user!.displayName!,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFfafafa),
              ),
            ),
            accountEmail: Text(
              user!.email!,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFfafafa),
                fontWeight: FontWeight.w500,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  user!.photoURL!,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFe0f4f0),
              image: DecorationImage(
                image: AssetImage('assets/images/navimg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            tileColor: inactiveColor,
            selected: selected_opt[0],
            selectedTileColor: activeColor,
            leading: Icon(
              FontAwesomeIcons.house,
              color: iconClr,
              size: 24,
            ),
            title: Text('Home'),
            onTap: () {
              if (!selected_opt[0]) {
                setState(() {
                  textColor = Color(0xFF000000);
                  set_opt(0);
                  Navigator.pushNamed(context, '/');
                });
              }
            },
          ),
          ListTile(
            tileColor: inactiveColor,
            selected: selected_opt[1],
            selectedTileColor: activeColor,
            leading: Icon(
              FontAwesomeIcons.brain,
              color: iconClr,
              size: 24,
            ),
            title: Text('Mental Health'),
            onTap: () {
              if (!selected_opt[1]) {
                setState(() {
                  textColor = Color(0xFF000000);
                  set_opt(1);
                  Navigator.pushNamed(context, '/mental_health_home');
                });
              }
            },
          ),
          ListTile(
            tileColor: inactiveColor,
            selected: selected_opt[2],
            selectedTileColor: activeColor,
            leading: Icon(
              FontAwesomeIcons.personWalking,
              color: iconClr,
              size: 24,
            ),
            title: Text('Physical Health'),
            onTap: () {
              if (!selected_opt[2]) {
                setState(() {
                  textColor = Color(0xFF000000);
                  set_opt(2);
                  Navigator.pushNamed(context, '/physical_health_home');
                });
              }
            },
          ),
          ListTile(
            tileColor: inactiveColor,
            selected: selected_opt[3],
            selectedTileColor: activeColor,
            leading: Icon(
              FontAwesomeIcons.peopleGroup,
              color: iconClr,
              size: 24,
            ),
            title: Text("Social Health"),
            onTap: () {
              if (!selected_opt[3]) {
                setState(
                  () {
                    textColor = Color(0xFF000000);
                    set_opt(3);
                    Navigator.pushNamed(context, '/social_health_home');
                  },
                );
              }
            },
          ),
          ListTile(
            tileColor: inactiveColor,
            selected: selected_opt[4],
            selectedTileColor: activeColor,
            leading: Icon(
              FontAwesomeIcons.houseLaptop,
              color: iconClr,
              size: 24,
            ),
            title: Text("Work Health"),
            onTap: () {
              if (!selected_opt[4]) {
                setState(() {
                  textColor = Color(0xFF000000);
                  set_opt(4);
                  Navigator.pushNamed(context, '/work_health_home');
                });
              }
            },
          ),
          // ListTile(
          //   tileColor: inactiveColor,
          //   selected: selected_opt[5],
          //   selectedTileColor: activeColor,
          //   leading: Icon(
          //     FontAwesomeIcons.solidAddressCard,
          //     color: iconClr,
          //     size: 24,
          //   ),
          //   title: Text("About Us"),
          //   onTap: () {
          //     if (!selected_opt[5]) {
          //       setState(() {
          //         textColor = Color(0xFF000000);
          //         set_opt(5);
          //         Navigator.pushNamed(context, '/');
          //       });
          //     }
          //   },
          // ),
          // ListTile(
          //   tileColor: inactiveColor,
          //   selected: selected_opt[6],
          //   selectedTileColor: activeColor,
          //   leading: Icon(
          //     FontAwesomeIcons.solidAddressBook,
          //     color: iconClr,
          //     size: 24,
          //   ),
          //   title: Text("Contact Us"),
          //   onTap: () {
          //     if (!selected_opt[6]) {
          //       setState(() {
          //         textColor = Color(0xFF000000);
          //         set_opt(6);
          //         Navigator.pushNamed(context, '/');
          //       });
          //     }
          //   },
          // ),
          // ListTile(
          //   tileColor: inactiveColor,
          //   selected: selected_opt[7],
          //   selectedTileColor: activeColor,
          //   leading: Icon(
          //     FontAwesomeIcons.chalkboardUser,
          //     color: iconClr,
          //     size: 24,
          //   ),
          //   title: Text('Learn More'),
          //   onTap: () {
          //     if (!selected_opt[7]) {
          //       setState(() {
          //         textColor = Color(0xFF000000);
          //         set_opt(7);
          //         Navigator.pushNamed(context, '/');
          //       });
          //     }
          //   },
          // ),
          ListTile(
            tileColor: inactiveColor,
            selected: selected_opt[8],
            selectedTileColor: activeColor,
            leading: Icon(
              FontAwesomeIcons.userDoctor,
              color: iconClr,
              size: 24,
            ),
            title: Text('Consult Doctor'),
            onTap: () {
              if (!selected_opt[8]) {
                setState(() {
                  textColor = Color(0xFF000000);
                  set_opt(8);
                  Navigator.pushNamed(context, '/doctor_consultation');
                });
              }
            },
          ),
          Divider(
            thickness: 1.5,
          ),
          ListTile(
            tileColor: inactiveColor,
            selected: selected_opt[9],
            selectedTileColor: activeColor,
            leading: Icon(
              FontAwesomeIcons.rightFromBracket,
              color: iconClr,
              size: 24,
            ),
            title: Text('Logout'),
            onTap: () {
              if (!selected_opt[9]) {
                setState(() {
                  textColor = Color(0xFF000000);
                  set_opt(9);
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
