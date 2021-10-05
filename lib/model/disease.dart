import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class Disease {
  String name;
  String desc;
  String longDesc;
  String probability;

  Disease({
    @required this.name,
    @required this.desc,
    @required this.longDesc,
    @required this.probability,
  });

  Disease copyWith({
    String name,
    String desc,
    String longDesc,
    String probability,
  }) {
    return Disease(
      name: name ?? this.name,
      desc: desc ?? this.desc,
      longDesc: longDesc ?? this.longDesc,
      probability: probability ?? this.probability,
    );
  }

  static Disease fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Disease(
      name: map['name'],
      desc: map['desc'],
      //TODO: to change to longdesc after api update
      longDesc: map['desc'],
      probability: map['probability'],
    );
  }

  static Disease fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Disease(name: $name, desc: $desc, longDesc: $longDesc, probability: $probability)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Disease &&
        o.name == name &&
        o.desc == desc &&
        o.longDesc == longDesc &&
        o.probability == probability;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        desc.hashCode ^
        longDesc.hashCode ^
        probability.hashCode;
  }
}
