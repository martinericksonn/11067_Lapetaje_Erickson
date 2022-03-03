// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../safe_dial.dart';

class SafeDialScreen extends StatefulWidget {
  const SafeDialScreen({Key? key}) : super(key: key);

  @override
  State<SafeDialScreen> createState() => _SafeDialScreen();
}

class _SafeDialScreen extends State<SafeDialScreen> {
  final String _combination = "555";

  List<int> _values = [5, 5, 5];
  bool _isUnlocked = false;
  String _feedback = "";
  Color _feedbackColor = Colors.black;

  bool checkCombination() {
    String theCurrentValue = convertValuesToComparableString(_values);
    bool isUnlocked = (theCurrentValue == _combination);
    return isUnlocked;
  }

  String convertValuesToComparableString(List<int> val) {
    String temp = "";
    for (int v in val) {
      temp += "$v";
    }
    return temp;
  }

  unlockSafe() {
    setState(() {
      if (_isUnlocked) {
        _values = [5, 5, 5];
        _isUnlocked = false;
      } else if (checkCombination()) {
        _isUnlocked = true;
        _feedback = "You unlocked the Door!";
        _feedbackColor = Colors.greenAccent;
      } else {
        _isUnlocked = false;
        _feedback = "Wrong combination, try again!";
        _feedbackColor = Colors.redAccent;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/locker.png'),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1),
              BlendMode.dstATop,
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lock Breaker",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Icon(
                  _isUnlocked ? Icons.lock_open : Icons.lock_outline_rounded,
                  size: 48,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _values.length; i++)
                    SafeDial(
                      valueKey: _values[i],
                      valueChange: (value) => setState(
                        () {
                          _values[i] = value;
                          _feedback = "";
                        },
                      ),
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  _feedback,
                  style: TextStyle(
                    color: _feedbackColor,
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: unlockSafe,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text(_isUnlocked ? 'Lock Door' : 'Unlock Door'),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: OutlinedButton(
                  onPressed: () {
                    
                    Navigator.of(context).pop(_isUnlocked);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text("Back"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
