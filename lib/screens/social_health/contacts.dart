// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

import 'add_contacts.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'edit_contact.dart';
import 'package:url_launcher_android/url_launcher_android.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final user = FirebaseAuth.instance.currentUser;
  var emailid;
  late Query _ref;
  DatabaseReference reference = FirebaseDatabase.instance.reference().child(
      'Contacts'); //by making it a member function we will have to call it only once in our dialog box (app) below otherwise we had to instanciate every time user clicks on delete button
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: deprecated_member_use
    _ref = FirebaseDatabase.instance
        // ignore: deprecated_member_use
        .reference()
        .child('Contacts')
        .orderByChild('name');
    emailid = user?.email;
  }

  Widget _buildContactItem({required Map contact}) {
    Color typecolor = getTypeColor(contact['type']);
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 10),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 238, 238),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 211, 195, 208),
                offset: Offset(0.0, 5.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.person,
                      color: Theme.of(context).primaryColor, size: 20),
                  SizedBox(width: 6),
                  Text(contact['name'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.phone_iphone, color: Colors.grey, size: 20),
                  SizedBox(width: 6),
                  Text(contact['number'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(width: 10),
                  Icon(Icons.connect_without_contact,
                      color: typecolor, size: 20),
                  SizedBox(width: 6),
                  Text(contact['type'],
                      style: TextStyle(
                        fontSize: 16,
                        color: typecolor,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () async {
                        final phoneNumber = contact['number'];
                        final url = Uri.parse('tel://$phoneNumber');
                        if (!await launchUrl(url,
                            mode: LaunchMode.externalApplication)) {
                          throw 'Could not launch';
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.call_outlined,
                            color: Colors.black38,
                          ),
                          SizedBox(width: 6),
                          Text('Call',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black38,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      )),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  EditContact(contactKey: contact['key'])),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 6),
                          Text('Edit',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      )),
                  SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        _showDeleteDialog(contact: contact);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.red[700],
                          ),
                          SizedBox(width: 6),
                          Text('Delete',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red[700],
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  _showDeleteDialog({required Map contact}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete ${contact['name']}'),
          content: Text('Are you sure you want to delete?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
            TextButton(
                onPressed: () {
                  reference
                      .child(contact['key'])
                      .remove()
                      .whenComplete(() => Navigator.pop(context));
                },
                child: Text('Delete'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'My Contacts',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value as Map;
            contact['key'] = snapshot.key;
            if (contact['id'] == emailid)
              return _buildContactItem(contact: contact);
            else
              return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return AddContacts();
          }));
        },
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
      ),
    );
  }
}

Color getTypeColor(String type) {
  Color color = Colors.teal;
  if (type == 'Family') color = Colors.pink;
  if (type == 'Friend') color = Colors.green;
  if (type == 'Close Friend') color = Color.fromARGB(255, 76, 69, 9);
  if (type == 'Work') color = Colors.blue;
  if (type == 'Classmate') color = Colors.deepOrange;
  if (type == 'Family') color = Colors.pink;
  if (type == 'Others') color = Colors.cyan;
  return color;
}
