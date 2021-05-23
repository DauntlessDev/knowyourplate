import 'package:flutter/material.dart';

class RecordView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI Capture"),
      ),
      body: Center(
        child: Container(
          child: Text('Record View'),
        ),
      ),
    );
  }
}
