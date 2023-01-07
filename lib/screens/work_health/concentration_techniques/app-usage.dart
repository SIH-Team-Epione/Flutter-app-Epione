import 'package:flutter/material.dart';
import 'package:app_usage/app_usage.dart';
import 'package:provider/provider.dart';

class AppTimer extends StatefulWidget {
  const AppTimer({Key? key}) : super(key: key);

  @override
  State<AppTimer> createState() => _AppTimerState();
}

Duration a = Duration(hours: 0, minutes: 0);

class _AppTimerState extends State<AppTimer> {
  List<AppUsageInfo> _infos = [];
  List<Duration> limits = List.filled(100, a);
  List<bool> isUnderLimit = List.filled(100, true);
  String selectedApp = '';
  int hours = 0, minutes = 0;
  int idx = -1;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _hourFieldController = TextEditingController();
  final TextEditingController _minFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUsageStats();
  }

  void getUsageStats() async {
    try {
      DateTime endDate = new DateTime.now();
      DateTime startDate = DateTime(endDate.year, endDate.month, endDate.day);
      List<AppUsageInfo> infoList =
      await AppUsage().getAppUsage(startDate, endDate);
      infoList = removeSystemApps(infoList);
      infoList.sort((a, b) => b.usage.toString().compareTo(a.usage.toString()));
      setState(() {
        _infos = infoList;
      });

      print(_infos);
      for (var info in infoList) {
        print(info.toString());
      }

      selectedApp = _infos[0].appName.toString().toUpperCase();
    } on AppUsageException catch (exception) {
      print(exception);
    }
  }

  List<AppUsageInfo> removeSystemApps(List<AppUsageInfo> infoList) {
    // add names of system apps here
    List<String> sysAppNames = ['android', 'launcher', 'user', 'app', 'gm', 'telephonyui', 'daemonapp', 'permissioncontroller', 'gms', 'packageinstaller', 'systemui'];
    for (String sysApp in sysAppNames) {
      infoList.removeWhere((info) => info.appName.toString() == sysApp);
    }
    return infoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Usage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10.0,),
          Form(
            key: _formKey,
            child: DropdownButton<String>(
              hint: Text('Choose application'),
              value: selectedApp,
              items: _infos.map((_info) {
                return DropdownMenuItem<String>(
                  value: _info.appName.toString().toUpperCase(),
                  child: Text(_info.appName.toString().toUpperCase()),
                );
              }).toSet().toList(),
              onChanged: (info) {
                // int idx = -1;
                setState(() {
                  selectedApp = info!;
                });
                for (idx = 0 ; idx < _infos.length; idx++) {
                  if (_infos[idx].appName.toString().toUpperCase() == info) {
                    break;
                  }
                }
                print('index: $idx');
              },
            ),
          ),
          Row(
            children: [
              SizedBox(width: 20.0,),
              Container(
                width: MediaQuery.of(context).size.width * 0.45 - 20.0,
                child: TextFormField(
                  controller: _hourFieldController,
                  decoration: const InputDecoration(hintText: 'Hours'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the number of hours';
                    } else if (int.parse(value) >= 24 ||
                        int.parse(value) <= 0) {
                      return 'Please enter valid hours';
                    }
                    return null;
                  },
                  maxLines: 1,
                  onSaved: (value) {
                    hours = int.parse(value!);
                  },
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.45 - 20.0,
                child: TextFormField(
                  controller: _minFieldController,
                  decoration: const InputDecoration(hintText: 'Minutes'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the number of minutes';
                    } else if (int.parse(value) >= 60 ||
                        int.parse(value) <= 0) {
                      return 'Please enter valid minutes';
                    }
                    return null;
                  },
                  maxLines: 1,
                  onSaved: (value) {
                    minutes = int.parse(value!);
                  },
                ),
              ),
              // SizedBox(width: 20.0,),
            ],
          ),
          SizedBox(height: 10.0,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade400,),
              child: Text(
                'Set',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate())
                  _formKey.currentState!.save();
                print('INDEX: $idx');
                limits[idx] = helper(_hourFieldController.text, _minFieldController.text);
                hours = int.parse(_hourFieldController.text);
                minutes = int.parse(_minFieldController.text).remainder(60);
                if (limits[idx].compareTo(_infos[idx].usage) >= 0) {
                  isUnderLimit[idx] = true;
                }
                else {
                  isUnderLimit[idx] = false;
                }
              }
          ),
          SizedBox(height: 15.0,),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.75,
          //   child:
          Flexible(
            child:
            ListView.builder(
                itemCount: _infos.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                        _infos[index].appName.toString().toUpperCase(),
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color:
                            // isCrossed(_infos[index].usage, hours, minutes) ?
                            isUnderLimit[index] ?
                            // isCrossed(_infos[index].usage, _infos[index].usage.inHours, _infos[index].usage.inMinutes.remainder(60)) ?
                            Colors.green.shade400 : Colors.red.shade400
                        ),
                      ),
                      subtitle: Text(
                          _infos[index].usage.inHours.toString() + ' hours ' + _infos[index].usage.inMinutes.remainder(60).toString() + ' minutes'
                      ),
                      trailing:
                      // isCrossed(_infos[index].usage, hours, minutes) ?
                      // isCrossed(_infos[index].usage, _infos[index].usage.inHours, _infos[index].usage.inMinutes.remainder(60)) ?
                      isUnderLimit[index] ?
                      Icon(Icons.check_rounded, color: Colors.green.shade400,) :
                      Icon(Icons.close_rounded, color: Colors.red.shade400,)
                  );
                }),
          ),
        ],
      ),
    );
  }

  bool isCrossed(Duration a, int hours, int mins) {
    if (a.inHours == hours) return a.inMinutes > mins;
    return a.inHours > hours;
  }

  Duration helper (String hours, String minutes) {
    int hrs = int.parse(hours);
    int mins = int.parse(minutes);

    return Duration(hours: hrs, minutes: mins);
  }

}
