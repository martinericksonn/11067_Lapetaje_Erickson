// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:todo_app/src/screens/register/register_screen.dart';

import '../../classes/controllers/auth_login_controller.dart';

class LoginScreen extends StatefulWidget {
  final AuthController auth;

  const LoginScreen(
    this.auth, {
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCon = TextEditingController(),
      _passCon = TextEditingController();
  String prompts = '';
  AuthController get _auth => widget.auth;

  var emailBorderColor = Colors.black;
  var emailBorderWidth = 1.0;

  var passwordBorderColor = Colors.black;
  var passwordBorderWidth = 1.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: appBar(context),
        // ignore: prefer_const_literals_to_create_immutables
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  upperBody(context),
                  lowerBody(context),
                ],
              ),
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
        height: MediaQuery.of(context).size.height * 0.50,
        // color: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Column(
              children: [
                title(),
                SizedBox(height: 20),
                emailTextField(context),
                passwordTextField(context),
                forgetPassword(context),
              ],
            ),
            Text(
              prompts,
              style: TextStyle(
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                loginButton(context),
                registerButton(context),
              ],
            ),
            // TextFormField(),
          ],
        ),
      ),
    );
  }

  Row registerButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New to Tasuku?",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ),
              );
            },
            child: Text(
              "Register",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }

  TextButton loginButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          bool result = _auth.login(_emailCon.text, _passCon.text);
          if (!result) {
            setState(() {
              prompts = prompts != ""
                  ? prompts
                  : 'Email or password may be incorrect or the user has not been registered yet.';
            });
          }
        }
      },
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
            "Login",
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
        "Be productive.",
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
              color: passwordBorderColor,
              width: passwordBorderWidth,
            ), // set
            // color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          controller: _passCon,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              setState(() {
                prompts = "Fields cannot be empty";
                passwordBorderColor = Colors.red;
                passwordBorderWidth = 2;
              });
              // return 'Please enter your Email';
            } else {
              setState(() {
                prompts = "";
                passwordBorderColor = Colors.black;
                passwordBorderWidth = 1;
              });
            }
            return null;
          },
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: TextStyle(color: passwordBorderColor),
            hintText: "Password",
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
              color: emailBorderColor, // set border color
              width: emailBorderWidth,
            ), // set
            // color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          controller: _emailCon,
          validator: (value) {
            if (value == null || value.isEmpty) {
              setState(() {
                prompts = "Fields cannot be empty";
                emailBorderColor = Colors.red;
                emailBorderWidth = 2;
              });
              // return 'Please enter your Email';
            } else {
              setState(() {
                prompts = "";
                emailBorderColor = Colors.black;
                emailBorderWidth = 1;
              });
            }
            return null;
          },
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintStyle: TextStyle(color: emailBorderColor),
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
        padding: EdgeInsets.only(top: 18.0),
        child: Image(
          image: AssetImage("assets/images/login.png"),
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
