import 'package:flutter/material.dart';

class SharedExperiencesScreen extends StatefulWidget {
  const SharedExperiencesScreen({Key? key}) : super(key: key);

  @override
  State<SharedExperiencesScreen> createState() => _SharedExperiencesScreenState();
}

class _SharedExperiencesScreenState extends State<SharedExperiencesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Shared Experiences'),
          centerTitle: false,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Posts',
              ),
              Tab(
                text: 'My Posts',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Text('First'),
            ),
            Container(
              child: Text('second'),
            )
          ],
        )
      ),
    );
  }
}
