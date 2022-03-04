// ignore_for_file: prefer_const_constructors

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/final_screen.dart';

class UnlockedDoor extends StatelessWidget {
  const UnlockedDoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/bkg3.png"),
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
                        "The door is ",
                      ),
                      Text(
                        "open.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Image(
                image: AssetImage("assets/images/unlocked_door.png"),
                height: 150,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 140,
                child: OutlinedButton(
                  onPressed: () async => await openDoor(context),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Text("Leave House"),
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
                    child: Text("Lock Door"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openDoor(BuildContext context) async {
    List<String>? boyName = await showTextInputDialog(
      context: context,
      textFields: [
        DialogTextField(
          keyboardType: TextInputType.text,
        ),
      ],
      title: "Enter the boy's name",
    );

    if (boyName != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FinalScreen(
            boyName: boyName[0],
          ),
        ),
      );
    }
  }
}
