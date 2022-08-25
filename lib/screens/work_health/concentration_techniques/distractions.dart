import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';

class EliminateDistractions extends StatefulWidget {
  @override
  _EliminateDistractionsState createState() => _EliminateDistractionsState();
}

class _EliminateDistractionsState extends State<EliminateDistractions> with WidgetsBindingObserver{
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
  List<int> _filtersInt = [
    1,
    2,
    3,
    4,
  ];
  List<String> _filtersDescription = [
    'DnD is turned off, notifications will be received.',
    'Only Priority Notifications shown. Everything else is suppressed.',
    'DnD is turned on, no notifications will be received.',
    'Only Alarms can trigger notifications.',
  ];
  List<String> _filterStates = [
    'INTERRUPTION_FILTER_ALL',
    'INTERRUPTION_FILTER_PRIORITY',
    'INTERRUPTION_FILTER_NONE',
    'INTERRUPTION_FILTER_ALARMS',
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
        _currentFilter = _filtersInt.indexOf(filter);
        _filterTitle = _filters[filter-1];
        _isLoading = false;
      });
    }
  }
  void setInterruptionFilter(int filter) async {
    final bool? isNotificationPolicyAccessGranted =
    await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isNotificationPolicyAccessGranted != null &&
        isNotificationPolicyAccessGranted) {
      await FlutterDnd.setInterruptionFilter(filter + 1);
      updateUI();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        // backgroundColor: Color(0xFF85F4FF),
        backgroundColor: Colors.teal,
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
                'Eliminate Distractions',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    // letterSpacing: 1.05
                    color: Colors.white
                ),
              ),
            ),
            // SizedBox(width: MediaQuery.of(context).size.width / 3),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {

                },
                icon: Icon(
                    Icons.person,
                    color: Color(0xFFFFFFFF)
                ),
              ),
            )
          ],
        ),
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator()) : Container(
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
                          color: Colors.grey[300]
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    // color: _filterName == "INTERRUPTION_FILTER_ALL" ? Colors.red[400] : Color(0xFF000000),
                    color: _filterName == "INTERRUPTION_FILTER_ALL" ? Colors.grey[900] : Colors.cyan[300],
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Colors.teal.shade500,
                        width: 15.0
                    ),
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
                  case 3: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_ALARMS);
                  break;
                  case 4: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_NONE);
                  break;
                  default: FlutterDnd.setInterruptionFilter(FlutterDnd.INTERRUPTION_FILTER_UNKNOWN);
                }
                setInterruptionFilter(_filtersInt.indexOf(int.parse(value.toString())));
              },
            ),
            SizedBox(height: 12.0),
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
            RaisedButton(
              onPressed: () {
                FlutterDnd.gotoPolicySettings();
              },
              elevation: 4.0,
              color: Colors.tealAccent.shade400,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
    );
  }
}
