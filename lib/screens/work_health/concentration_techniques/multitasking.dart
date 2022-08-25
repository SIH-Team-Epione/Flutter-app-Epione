import 'package:flutter/material.dart';

class ReducingMultiTasking extends StatefulWidget {
  @override
  _ReducingMultitasking createState() => _ReducingMultitasking();
}

int _counter = 1;

class Task {
  Task({required this.number, required this.title, required this.time, required this.checked});
  late int number;
  late final String title;
  late double time;
  late bool checked;
}

class _ReducingMultitasking extends State<ReducingMultiTasking> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _timeFieldController = TextEditingController();
  final List<Task> _tasks = <Task>[];
  final _formKey = GlobalKey<FormState>();
  // bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reduce Multitasking'),
      ),
      body: Column(
        children: [
          TextButton(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.add_rounded,
                    size: 24.0,
                  ),
                  SizedBox(width: 10.0),
                  Center(
                    child: Text(
                      'Add a new Task',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () async {
              print('Clicked');
              await _displayDialog(context);
            },
          ),
          Expanded(
            flex: 5,
            child: ListView(
              //padding: EdgeInsets.symmetric(vertical: 10.0),
              children: _tasks.map((Task task) {
                return TaskItem(
                  task: task,
                  onTaskChanged : _handleTaskChange,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          title: const Text(
              'Add a new task item',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Colors.black,
              )
          ),
          content: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _textFieldController,
                  decoration: const InputDecoration(hintText: 'Task name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the task name';
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _timeFieldController,
                  decoration: const InputDecoration(hintText: 'Task duration (hours)'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the task duration';
                    }
                    return null;
                  },
                  maxLines: 1,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                  'Add',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  )
              ),
              onPressed: () {
                Navigator.of(context).pop();
                checkValidation(_formKey);
                _addTaskItem(_textFieldController.text, double.parse(_timeFieldController.text));
                // if (_formKey.currentState?.validate())
                //_formKey.currentState?.save();
              },
            ),
          ],
        );
      },
    );
  }

  void _addTaskItem(String title, double time) {
    // if (title.length == 0) {
    //   title = 'Task';
    // }
    // else if (time == null) {
    //   time = 0.0;
    // }
    setState(() {
      _tasks.add(Task(number: _counter, title: title, time: time, checked: false));
    });
    _counter++;
    _textFieldController.clear();
    _timeFieldController.clear();
  }

  void _handleTaskChange(Task task) {
    setState(() {
      task.checked = !task.checked;
    });
  }
  checkValidation(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      print('Validated');
    }
    else {
      print('Not Validated');
    }
  }
}

class TaskItem extends StatelessWidget {
  TaskItem({
    required this.task,
    required this.onTaskChanged,
  }) : super(key: ObjectKey(task));

  final Task task;
  final onTaskChanged;

  TextStyle? _getTextStyle1(bool checked) {
    if (!checked) return null;

    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 22.0,
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle? _getTextStyle2(bool checked) {
    if (!checked) return null;

    return TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      onTap: () {
        onTaskChanged(task);
      },
      onLongPress: () {
        // edit the task
      },
      leading: CircleAvatar(
        radius: 30.0,
        child: Text(
          '#${task.number}',
          style: TextStyle(
            color: Color(0xFF293241),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: task.checked ? Color(0xFFBDBDBD) : Colors.tealAccent.shade400,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            task.title,
            style: task.checked ? _getTextStyle1(task.checked) :
            TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 22.0
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            (task.time).toString() + ' hours',
            style: task.checked ? _getTextStyle2(task.checked) :
            TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 14.0
            ),
          ),
        ],
      ),
      minVerticalPadding: 20.0,
    );
  }

}