// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  FinalScreen({Key? key, required this.boyName}) : super(key: key);
  String boyName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/bkg4.png"),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  "The End.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 28.0, top: 12, left: 18, right: 18),
                child: Text(
                  "The boy $boyName has just begun his adventure\n until the next episode! Thank you for playing!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const Image(
                image: AssetImage("assets/images/adventure.png"),
                height: 220,
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 140,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Reset",
                    ),
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
