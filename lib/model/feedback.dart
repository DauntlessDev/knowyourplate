

import 'package:flutter/foundation.dart';

class Feedback {
  Feedback({
    @required this.title,
    @required this.details,
  });

  final String title;
  final String details;

  @override
  String toString() => 'Feedback(title: $title, details: $details)';

}