// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/safe_dial_screen.dart';
import 'package:flutter_application_1/screen/unlocked_door.dart';

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/bkg2.png"),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "The boy want to go out, door is ",
                      ),
                      Text(
                        isDoorUnlocked ? "unlocked." : "locked.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Image(
                image: AssetImage("assets/images/locked_door.png"),
                height: 150,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 140,
                child: OutlinedButton(
                  onPressed: () async {
                    await goToSafeDial(context);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    child: Text(isDoorUnlocked ? "Open Door" : "Examine Door"),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text('Back'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> goToSafeDial(BuildContext context) async {
    bool? isDoorOpen = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            isDoorUnlocked ? UnlockedDoor() : SafeDialScreen(),
      ),
    );

    setState(() {
      (isDoorOpen ?? false) ? isDoorUnlocked = true : isDoorUnlocked = false;
    });
  }
}
