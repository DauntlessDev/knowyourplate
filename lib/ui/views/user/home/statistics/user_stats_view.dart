import 'package:flutter/material.dart';

class UserStatsView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('User Statistics'),
        ),
      ),
    );
  }
}
