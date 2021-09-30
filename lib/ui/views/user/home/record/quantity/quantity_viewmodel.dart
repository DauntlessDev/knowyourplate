import 'package:flutter/services.dart';
import 'package:knowyourplate/model/feedback.dart';
import 'package:knowyourplate/services/state_services/current_food_service.dart';
import 'package:stacked/stacked.dart';

class QuantityViewModel extends BaseViewModel {
  final _currentFood = CurrentFoodService.instance;

  double calculateFatComponent(
      {double meat = 0, double milk = 0, double vegetable = 0}) {
    return ((meat * 5.0) + (milk * 8.0) + (vegetable * 1.0));
  }

  double calculateProteinComponent(
      {double meat = 0, double milk = 0, double vegetable = 0}) {
    return ((meat * 10.0) + (milk * 8.0) + (vegetable * .5));
  }

  double calculateCarbsComponent(
      {double meat = 0, double milk = 0, double vegetable = 0}) {
    return ((meat * 25.0) + (milk * 11.0) + (vegetable * 6));
  }

  double convertInput(String input) {
    if (input.isEmpty) {
      return 0;
    } else if (double.tryParse(input) != null) {
      return double.parse(input);
    } else {
      return int.parse(input).toDouble();
    }
  }

  Feedback calculateComponents() {
    try {
      _currentFood.record.fats = calculateFatComponent(
          meat: convertInput(meatQuantity),
          milk: convertInput(milkQuantity),
          vegetable: convertInput(vegetableQuantity));

      _currentFood.record.carbs = calculateCarbsComponent(
          meat: convertInput(meatQuantity),
          milk: convertInput(milkQuantity),
          vegetable: convertInput(vegetableQuantity));

      _currentFood.record.protein = calculateProteinComponent(
          meat: convertInput(meatQuantity),
          milk: convertInput(milkQuantity),
          vegetable: convertInput(vegetableQuantity));

      if (hasMeat) {
        _currentFood.setCurrentMeatQuanity(convertInput(meatQuantity));
      }
      if (hasVegetable) {
        _currentFood
            .setCurrentVegetableQuanity(convertInput(vegetableQuantity));
      }
      if (hasMilk) {
        _currentFood.setCurrentMilkQuanity(convertInput(milkQuantity));
      }

      return Feedback(
          title: 'Success', details: 'Calculating components is successful.');
    } on PlatformException catch (e) {
      return Feedback(title: 'Failed', details: e.message);
    }
  }

  bool hasMeat = false, hasMilk = false, hasVegetable = false;

  String _meatQuantity = '';
  String get meatQuantity => _meatQuantity;
  setMeatQuantity(String input) => _meatQuantity = input;

  String _milkQuantity = '';
  String get milkQuantity => _milkQuantity;
  setMilkQuantity(String input) => _milkQuantity = input;

  String _vegetableQuantity = '';
  String get vegetableQuantity => _vegetableQuantity;
  setVegetableQuantity(String input) => _vegetableQuantity = input;

  void initialize() {
    var containMeat = _currentFood.record.ingredients
        .where((element) => element.name == 'meat');
    var containVegetables = _currentFood.record.ingredients
        .where((element) => element.name == 'vegetables');
    var containMilk = _currentFood.record.ingredients
        .where((element) => element.name == 'milk');

    hasMeat = containMeat.isNotEmpty;
    hasVegetable = containVegetables.isNotEmpty;
    hasMilk = containMilk.isNotEmpty;

    print('done initializing calculator');
  }

  Feedback result;
}
