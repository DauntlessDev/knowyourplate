import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class Food {
  String foodname;
  List<String> components;

  Food({
    @required this.foodname,
    @required this.components,
  });

  Food copyWith({
    String foodname,
    List<String> components,
  }) {
    return Food(
      foodname: foodname ?? this.foodname,
      components: components ?? this.components,
    );
  }


  static Food fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Food(
      foodname: map['prediction']['food'],
      components: List<String>.from(map['prediction']['components']),
    );
  }

  static Food fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(foodname: $foodname, components: $components)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Food &&
        o.foodname == foodname &&
        listEquals(o.components, components);
  }

  @override
  int get hashCode {
    return foodname.hashCode ^ components.hashCode;
  }
}
