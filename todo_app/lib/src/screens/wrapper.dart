import 'package:flutter/widgets.dart';

import 'package:todo_app/src/screens/home.dart';
import 'package:todo_app/src/screens/login/login_screen.dart';
import '../classes/controllers/auth_controller.dart';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _authController,
        builder: (context, Widget? w) {
          if (_authController.currentUser == null) {
            return LoginScreen(_authController);
          } else {
            return HomeScreen(_authController);
          }
        });
  }
}
