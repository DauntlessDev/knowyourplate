import 'package:flutter/foundation.dart';

class Ingredient {
  Ingredient({
    @required this.name,
    @required this.quantity,
  });

  final String name;
  double quantity;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
