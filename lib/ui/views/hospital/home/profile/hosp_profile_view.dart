import 'package:flutter/material.dart';

class HospProfileView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const HospProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Hospital Profile View'),);
  }
}