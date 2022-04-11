// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: appBar(context),
        // ignore: prefer_const_literals_to_create_immutables
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                upperBody(context),
                lowerBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding lowerBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: SizedBox(
        // color: Colors.pink,
        height: MediaQuery.of(context).size.height * 0.55,
        // color: Colors.pink,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                children: [
                  title(),
                  SizedBox(height: 20),
                  usernameTextField(context),
                  emailTextField(context),
                  passwordTextField(context),
                ],
              ),
              // Text(
              //   "Invalid Email",
              //   style: TextStyle(
              //     color: Colors.red,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Column(
                children: [
                  registerButton(context),
                  loginButton(context),
                ],
              ),
              // TextFormField(),
            ],
          ),
        ),
      ),
    );
  }

  Row loginButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Joined us before?",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Login",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }

  TextButton registerButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: double.infinity,
        height: 60,
        // padding:
        //     EdgeInsets.symmetric(horizontal: 30, vertical: 22),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            "Register",
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1),
          ),
        ),
      ),
    );
  }

  Container forgetPassword(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forget password?",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  Container title() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.topLeft,
      child: Text(
        "Start your journey now.",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Container passwordTextField(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color:
                  Theme.of(context).colorScheme.secondary, // set border color
              width: 1.0,
            ), // set
            // color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: TextField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: "Password",
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          ),
        ));
  }

  Container usernameTextField(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color:
                  Theme.of(context).colorScheme.secondary, // set border color
              width: 1.0,
            ), // set
            // color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: const TextField(
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: "Username",
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          ),
        ));
  }

  Container emailTextField(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color:
                  // Colors.red,
                  Theme.of(context).colorScheme.secondary, // set border color
              width: 1.0,
            ), // set
            // color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: const TextField(
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: "Email",
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          ),
        ));
  }

  Stack upperBody(BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
          child: Text(
            "Tasuku",
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
      Container(
        // color: Colors.pink,
        height: 360,
        padding: EdgeInsets.only(top: 18.0),
        child: Image(
          image: AssetImage("assets/images/register.png"),
        ),
      )
    ]);
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        alignment: Alignment.centerRight,
        child: Text(
          "Tasuku",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
