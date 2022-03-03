// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/safe_dial_screen.dart';
import 'package:flutter_application_1/screen/welcome_screen.dart';

class LockedDoor extends StatefulWidget {
  const LockedDoor({Key? key}) : super(key: key);

  @override
  State<LockedDoor> createState() => _LockedDoorState();
}

class _LockedDoorState extends State<LockedDoor> {
  String appBarText = "The door is locked";
  String buttonText = "Examine Door";
  bool isDoorUnlocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          isDoorUnlocked ? "The door is unlocked" : "The door is locked",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image(
              image: AssetImage("assets/images/locked_door.png"),
              height: 150,
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () async {
                  await goToSafeDial(context);
                },
                child: Text(isDoorUnlocked ? "Open Door" : "Examine Door"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> goToSafeDial(BuildContext context) async {
    bool? isDoorOpen = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            isDoorUnlocked ? WelcomeScreen() : SafeDialScreen(),
      ),
    );

    setState(() {
      (isDoorOpen ?? false) ? isDoorUnlocked = true : isDoorUnlocked = false;
    });
  }
}
