// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {},
          child: const Text(
            "Reset",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: const Text(
                "Fin.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Image(
              image: AssetImage("assets/images/adventure.png"),
              height: 220,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "The boy named martin has just begun his adventure Thank you for playing",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
