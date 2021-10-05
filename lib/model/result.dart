import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:knowyourplate/model/disease.dart';
import 'package:meta/meta.dart';

class Result {
  int dietGroup;
  List<Disease> diseases;

  Result({
    @required this.dietGroup,
    @required this.diseases,
  });

  Result copyWith({
    String dietGroup,
    List<String> diseases,
  }) {
    return Result(
      dietGroup: dietGroup ?? this.dietGroup,
      diseases: diseases ?? this.diseases,
    );
  }

  static Result fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Result(
      dietGroup: map['prediction']['diet_group'],
      diseases:
          List<Disease>.from(map["diseases"]?.map((x) => Disease.fromMap(x))),
    );
  }

  static Result fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(dietGroup: $dietGroup, diseases: $diseases)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Result &&
        o.dietGroup == dietGroup &&
        listEquals(o.diseases, diseases);
  }

  @override
  int get hashCode {
    return dietGroup.hashCode ^ diseases.hashCode;
  }
}
