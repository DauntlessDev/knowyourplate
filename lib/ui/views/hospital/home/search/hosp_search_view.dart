import 'package:flutter/material.dart';

class HospSearchView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const HospSearchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hospital Search View'),
    );
  }
}
