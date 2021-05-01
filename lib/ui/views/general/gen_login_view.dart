import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/auth/userlogin/user_login_view.dart';
import 'package:knowyourplate/ui/widgets/roundedbutton.dart';
import 'package:knowyourplate/ui/widgets/top_background.dart';

class GeneralLoginPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          TopBackground(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 8),
                RoundedButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserLoginView()),
                    );
                  },
                  text: 'Login for Users',
                ),
                RoundedButton(
                  color: Colors.lightGreen,
                  onPressed: () => {},
                  text: 'Login for Hospitals',
                ),
                Spacer(flex: 11),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
