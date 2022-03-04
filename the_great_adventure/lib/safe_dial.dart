import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SafeDial extends StatelessWidget {
  final int valueKey;
  final Function(int) valueChange;
  const SafeDial({
    Key? key,
    required this.valueKey,
    required this.valueChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 0,
      maxValue: 9,
      value: valueKey,
      onChanged: valueChange,
    );
  }
}
