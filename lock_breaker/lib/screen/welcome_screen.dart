// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                "Prologue 1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "The boy who left home.",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Image(
                image: AssetImage(
                  'assets/images/welcome.png',
                ),
                height: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text("Continue"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
