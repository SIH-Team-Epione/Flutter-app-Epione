import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:permission_handler/permission_handler.dart';

class EliminateDistractions extends StatefulWidget {
  @override
  _EliminateDistractionsState createState() => _EliminateDistractionsState();
}

class _EliminateDistractionsState extends State<EliminateDistractions>
    with WidgetsBindingObserver {
  String _filterName = '';
  String _filterTitle = '';
  bool? _isNotificationPolicyAccessGranted = false;
  bool _isLoading = true;
  int _currentFilter = 0;
  List<String> _filters = [
    'Do not Disturb Off',
    'Priority Notifications',
    'Do not Disturb On',
    'Alarms only',
  ];
  List<String> _filtersDescription = [
    'DnD is turned off, notifications will be received.',
    'Only Priority Notifications shown. Everything else is suppressed.',
    'DnD is turned on, no notifications will be received.',
    'Only Alarms can trigger notifications.',
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state.toString());
    if (state == AppLifecycleState.resumed) {
      updateUI();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateUI();
  }

  void updateUI() async {
    int? filter = await FlutterDnd.getCurrentInterruptionFilter();
    print('filter: $filter');

    if (filter != null) {
      String filterName = FlutterDnd.getFilterName(filter);
      bool? isNotificationPolicyAccessGranted =
          await FlutterDnd.isNotificationPolicyAccessGranted;
      setState(() {
        _isNotificationPolicyAccessGranted = isNotificationPolicyAccessGranted;
        _filterName = filterName;
        _currentFilter = filter - 1;
        _filterTitle = _filters[_currentFilter];
        _isLoading = false;
      });
    }
  }

  void setInterruptionFilter(int filter) async {
    checkPermission();
    final bool? isNotificationPolicyAccessGranted =
        await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isNotificationPolicyAccessGranted != null &&
        isNotificationPolicyAccessGranted) {
      await FlutterDnd.setInterruptionFilter(filter + 1);
      updateUI();
    }
  }

  void checkPermission() async {
    PermissionStatus status =
        await Permission.accessNotificationPolicy.request();
    print(status);
    if (status.isDenied == true) {
      FlutterDnd.gotoPolicySettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminate Distractions'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Color(0xFFFFFFFF),
              child: Column(
                children: <Widget>[
                  Center(
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 50.0),
                        width: 300.0,
                        height: 300.0,
                        child: Center(
                          child: Text(
                            '$_filterTitle',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                                color: Colors.grey[300]),
                          ),
                        ),
                        decoration: BoxDecoration(
                          // color: _filterName == "INTERRUPTION_FILTER_ALL" ? Colors.red[400] : Color(0xFF000000),
                          color: _filterName == "INTERRUPTION_FILTER_ALL"
                              ? Colors.grey[900]
                              : Colors.cyan[300],
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.teal.shade500, width: 15.0),
                          //borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                      ),
                      onTap: () {
                        // if (_filterName == "INTERRUPTION_FILTER_NONE") {
                        //   print('Hello1');
                        //   FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_ALL);
                        // }
                        // else {
                        //   print('Hello2');
                        //   FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_NONE);
                        // }
                      },
                    ),
                  ),
                  //Text('Current interruption filter: $_filterName'),
                  //Text('Notification policy access granted: $_isNotificationPolicyAccessGranted'),
                  DropdownButton(
                    value: _currentFilter + 1,
                    items: _filters.map((String value) {
                      return DropdownMenuItem(
                        value: _filters.indexOf(value) + 1,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      int idx = int.parse(value.toString());
                      print(idx);
                      // setInterruptionFilter(_filtersInt.indexOf(int.parse(value.toString())));
                      switch (idx) {
                        case 1:
                          FlutterDnd.setInterruptionFilter(
                              FlutterDnd.INTERRUPTION_FILTER_ALL);
                          break;
                        case 2:
                          FlutterDnd.setInterruptionFilter(
                              FlutterDnd.INTERRUPTION_FILTER_PRIORITY);
                          break;
                        case 3:
                          FlutterDnd.setInterruptionFilter(
                              FlutterDnd.INTERRUPTION_FILTER_NONE);
                          break;
                        case 4:
                          FlutterDnd.setInterruptionFilter(
                              FlutterDnd.INTERRUPTION_FILTER_ALARMS);
                          break;
                        default:
                          FlutterDnd.setInterruptionFilter(
                              FlutterDnd.INTERRUPTION_FILTER_UNKNOWN);
                      }
                      setInterruptionFilter(idx - 1);
                    },
                  ),
                  SizedBox(height: 12.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
                    child: Text(
                      _filtersDescription[_currentFilter],
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  // // (checkPermission() == false) ? Text('Hello') : SizedBox(height: 0),
                  // SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 30),
                    child: Text(
                      'Please grant Do Not Disturb access permission to the application for using this feature.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: () {
                      FlutterDnd.gotoPolicySettings();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 4.0,
                      foregroundColor: Colors.tealAccent.shade400,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30.0),
                    ),
                    child: Text(
                      'GO TO POLICY SETTINGS',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Text('Current interruption filter: $_filterName'),
            //Text('Notification policy access granted: $_isNotificationPolicyAccessGranted'),
            DropdownButton(
              value: _currentFilter + 1,
              items: _filters.map((String value) {
                return DropdownMenuItem(
                  value: _filters.indexOf(value) + 1,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.black
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                int idx = int.parse(value.toString());
                print(idx);
                // setInterruptionFilter(_filtersInt.indexOf(int.parse(value.toString())));
                switch (idx) {
                  case 1: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_ALL);
                  break;
                  case 2: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_PRIORITY);
                  break;
                  case 3: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_NONE);
                  break;
                  case 4: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_ALARMS);
                  break;
                  default: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_UNKNOWN);
                }
                setInterruptionFilter(idx-1);
              },
            ),
            SizedBox(height: 12.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
              child: Text(
                _filtersDescription[_currentFilter],
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15.0),
            // // (checkPermission() == false) ? Text('Hello') : SizedBox(height: 0),
            // SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30
              ),
              child: Text(
                'Please grant Do Not Disturb access permission to the application for using this feature.',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 12
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 4.0,
                backgroundColor: Colors.tealAccent.shade400,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              ),
              onPressed: () {
                FlutterDnd.gotoPolicySettings();
              },
              child: Text(
                'GO TO POLICY SETTINGS',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
  }
}
