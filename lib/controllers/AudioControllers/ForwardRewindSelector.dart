import 'package:flutter/material.dart';

class ForwardRewindSelector extends StatelessWidget {
  final double speed;
  final Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            'Forward/Rewind ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          _button(-2),
          _button(2.0),
        ],
      ),
    );
  }

  Widget _button(double value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Radio(
        groupValue: speed,
        // padding: EdgeInsets.all(12.0),
        value: value,
        // style: NeumorphicRadioStyle(
        //   boxShape: NeumorphicBoxShape.circle(),
        // ),
        onChanged: (double? v) {
          if (v != null) onChange(v);
        },
      ),
    );
  }

  const ForwardRewindSelector({
    required this.speed,
    required this.onChange,
  });
}
