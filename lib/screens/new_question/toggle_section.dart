import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToggleSection extends StatefulWidget with ChangeNotifier {
  final _state = _ToggleSectionState();

  String get value => _state._value;

  @override
  State<StatefulWidget> createState() => _state;

  void notify() => notifyListeners();
}

class _ToggleSectionState extends State<ToggleSection> {
  String _value = "Q/A";
  List<bool> isSelected = [true, false, false, false, false];
  List<String> types = ["Q/A", "FTV", "FIB", "T/F", "REF"];

  _changeType(int index) {
    setState(() {
      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = true;
          _value = types[buttonIndex];
        }
        else
          isSelected[buttonIndex] = false;
      }
      widget.notify();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        child: ToggleButtons(
                children: types.map((s) => Text(s)).toList(),
                onPressed: (int index) => _changeType(index),
                isSelected: isSelected,
        ),
      ),
    );
  }
}
