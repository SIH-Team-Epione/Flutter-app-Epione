import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// const firebaseConfig={
//   databaseURL:"https://social-health-60238-default-rtdb.firebaseio.com/",
// }
class AddContacts extends StatefulWidget {
  const AddContacts({Key? key}) : super(key: key);

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  late TextEditingController _nameController, _numberController;
  String _typeSelected = '';
  late DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    // ignore: deprecated_member_use
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(6.0),
        height: 70,
        // width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _typeSelected == title
              ? Color.fromARGB(97, 243, 217, 140)
              : Color.fromARGB(255, 174, 117, 136),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: _typeSelected == title
                  ? Color.fromARGB(96, 14, 11, 4)
                  : Colors.white70,
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Add Contacts',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                prefixIcon: Icon(Icons.account_circle_rounded, size: 30),
                fillColor: Colors.white70,
                filled: true,
                contentPadding: EdgeInsets.all(15.0),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'Enter Number',
                prefixIcon: Icon(Icons.phone_iphone, size: 30),
                fillColor: Colors.white70,
                filled: true,
                contentPadding: EdgeInsets.all(15.0),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildContactType('Family'),
                  SizedBox(width: 15),
                  _buildContactType('Close Friend'),
                  SizedBox(width: 15),
                  _buildContactType('Friend'),
                  SizedBox(width: 15),
                  _buildContactType('Classmate'),
                  SizedBox(width: 15),
                  _buildContactType('Work'),
                  SizedBox(width: 15),
                  _buildContactType('Others'),
                  SizedBox(width: 15),
                ],
              ),
            ),
            SizedBox(height: 45.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                color: Colors.teal,
                child: Text(
                  'Save Contact',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  saveContact();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveContact() {
    String name = _nameController.text;
    String number = _numberController.text;
    Map<String, String> contact = {
      'name': name,
      'number': '+91' + number,
      'type': _typeSelected,
    };
    _ref.push().set(contact).then((value) {
      Navigator.pop(context);
    });
  }
}
