import 'package:flutter/material.dart';

class TopBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: MediaQuery.of(context).viewInsets.bottom < 50 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      child: Image(
        image: const AssetImage('assets/images/topbg.png'),
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}