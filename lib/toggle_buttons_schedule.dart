import 'package:flutter/material.dart';

import 'utils.dart';

class ToggleButtonsSchedule extends StatefulWidget {
  const ToggleButtonsSchedule({Key? key}) : super(key: key);

  @override
  State<ToggleButtonsSchedule> createState() => _ToggleButtonsScheduleState();
}

class _ToggleButtonsScheduleState extends State<ToggleButtonsSchedule> {
  List<bool> isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
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

  @override
  Widget build(BuildContext context) => ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: Colors.blue,
        renderBorder: true,
        children: const <Widget>[
          
        ],
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0;
                buttonIndex < isSelected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                isSelected[buttonIndex] = true;
              } else {
                isSelected[buttonIndex] = false;
              }
            }
          });
        },
      );
}
