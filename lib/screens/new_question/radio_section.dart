import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioSection extends StatefulWidget with ChangeNotifier {
  final _state = _RadioSectionState();

  String get value => _state.value;

  @override
  State<StatefulWidget> createState() => _state;

  void notify() => notifyListeners();
}

class _RadioSectionState extends State<RadioSection> {
  String _value;

  String get value => _value;

  _changeType(String value) {
    setState(() {
      _value = value;
      widget.notify();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Radio<String>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: "Q/A",
            groupValue: _value,
            onChanged: (value) => _changeType(value)),
        Text('Q/A', textAlign: TextAlign.left),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Radio<String>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: "FTV",
            groupValue: _value,
            onChanged: (value) => _changeType(value)),
        Text('FTV'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Radio<String>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: "FIB",
            groupValue: _value,
            onChanged: (value) => _changeType(value)),
        Text('FIB'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Radio<String>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: "T/F",
            groupValue: _value,
            onChanged: (value) => _changeType(value)),
        Text('T/F'),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Radio<String>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: "REF",
            groupValue: _value,
            onChanged: (value) => _changeType(value)),
        Text('REF'),
      ]
    );
  }
}
