import 'package:flutter/foundation.dart';

class Ingredient {
  Ingredient({
    @required this.name,
    @required this.quantity,
  });

  final String name;
  double quantity;

  factory Ingredient.fromJson(Map<String, dynamic> json){ 
     double quantityValue;
    
    if(json['quantity'] is int){
      quantityValue = json['quantity'].toDouble();
    } else{
      quantityValue = json['quantity'];
    }
    
    return Ingredient(
        name: json["name"],
        quantity: quantityValue,
      );
}


  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
