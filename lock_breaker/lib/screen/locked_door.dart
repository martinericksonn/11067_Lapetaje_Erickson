// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LockedDoor extends StatelessWidget {
  const LockedDoor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "The door is locked",
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
              child: TextButton(
                onPressed: () {},
                child: Text("Examine Door"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
