import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/landing_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Know Your Plate',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LandingView(),
    );
  }
}

//dev repo