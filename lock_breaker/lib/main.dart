// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/safe_dial.dart';
import 'package:flutter_application_1/screen/final_screen.dart';
import 'package:flutter_application_1/screen/locked_door.dart';
import 'package:flutter_application_1/screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lock Breaker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomeScreen()
        // const MyHomePage(title: 'Lock Breaker'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _combination = "842";

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
        _feedback = "You unlocked the vault!";
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
                widget.title,
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  _feedback,
                  style: TextStyle(
                    color: _feedbackColor,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: unlockSafe,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(_isUnlocked ? 'Reset Vault' : 'Unlock Vault'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
