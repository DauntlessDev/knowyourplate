import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:knowyourplate/model/ingredient.dart';
import 'package:meta/meta.dart';

class Record {
  String recordId;
  String userEmail;
  String title;
  String pictureUrl;
  String date;
  double carbs;
  double protein;
  double fats;
  List<Ingredient> ingredients;
  Record({
    @required this.recordId,
    @required this.userEmail,
    @required this.title,
    @required this.pictureUrl,
    @required this.date,
    @required this.carbs,
    @required this.protein,
    @required this.fats,
    @required this.ingredients,
  });

  Record copyWith({
    String recordId,
    String userEmail,
    String title,
    String pictureUrl,
    String date,
    double carbs,
    double protein,
    double fats,
    List<Ingredient> ingredients,
  }) {
    return Record(
      recordId: recordId ?? this.recordId,
      userEmail: userEmail ?? this.userEmail,
      title: title ?? this.title,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      date: date ?? this.date,
      carbs: carbs ?? this.carbs,
      protein: protein ?? this.protein,
      fats: fats ?? this.fats,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        recordId: json['recordId'],
        userEmail: json['userEmail'],
        title: json['title'],
        pictureUrl: json['pictureUrl'],
        date: json['date'],
        carbs: json['carbs'],
        protein: json['protein'],
        fats: json['fats'],
        ingredients: List<Ingredient>.from(
            json["ingredients"]?.map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toMap() {
    return {
      'recordId': recordId,
      'userEmail': userEmail,
      'title': title,
      'pictureUrl': pictureUrl,
      'date': date,
      'carbs': carbs,
      'protein': protein,
      'fats': fats,
      "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    };
  }

  // static Record fromMap(Map<String, dynamic> map) {
  //   if (map == null) return null;

  //   return Record(
  //     recordId: map['recordId'],
  //     userEmail: map['userEmail'],
  //     title: map['title'],
  //     pictureUrl: map['pictureUrl'],
  //     date: map['date'],
  //     carbs: map['carbs'],
  //     protein: map['protein'],
  //     fats: map['fats'],
  //     ingredients: List<Ingredient>.from(map['ingredients']),
  //   );
  // }

  String toJson() => json.encode(toMap());

  // static Record fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(recordId: $recordId, userEmail: $userEmail, title: $title, pictureUrl: $pictureUrl, date: $date, carbs: $carbs, protein: $protein, fats: $fats,ingredients: $ingredients )';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Record &&
        o.recordId == recordId &&
        o.userEmail == userEmail &&
        o.title == title &&
        o.pictureUrl == pictureUrl &&
        o.date == date &&
        o.carbs == carbs &&
        o.protein == protein &&
        o.fats == fats &&
        listEquals(o.ingredients, ingredients);
  }

  @override
  int get hashCode {
    return recordId.hashCode ^
        userEmail.hashCode ^
        title.hashCode ^
        pictureUrl.hashCode ^
        date.hashCode ^
        carbs.hashCode ^
        protein.hashCode ^
        fats.hashCode ^
        ingredients.hashCode;
  }
}
