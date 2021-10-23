import 'package:flutter/services.dart';
import 'package:knowyourplate/model/feedback.dart';
import 'package:knowyourplate/services/state_services/current_food_service.dart';
import 'package:stacked/stacked.dart';

class QuantityViewModel extends BaseViewModel {
  final _currentFood = CurrentFoodService.instance;

  double calculateFatComponent(
      {double meat = 0,
      double milk = 0,
      double vegetable = 0,
      double rice = 0,
      String meattype = 'Low'}) {
    double meatFactor = 1;
    if (meattype == 'Low') {
      meatFactor = 1.0;
    } else if (meattype == 'Med') {
      meatFactor = 6;
    } else if (meattype == 'High') {
      meatFactor = 10;
    }
    return ((meat * meatFactor) + (milk * 7.5));
  }

  double calculateProteinComponent(
      {double meat = 0,
      double milk = 0,
      double vegetable = 0,
      double rice = 0,
      String meattype = 'Low'}) {
    return ((meat * 8.0) + (milk * 8.0) + (vegetable * 1.0) + (rice * 2.0));
  }

  double calculateCarbsComponent(
      {double meat = 0,
      double milk = 0,
      double vegetable = 0,
      double rice = 0,
      String meattype = 'Low'}) {
    return ((milk * 12.0) + (vegetable * 3.0) + (rice * 23.0));
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
          vegetable: convertInput(vegetableQuantity),
          rice: convertInput(riceQuantity),
          meattype: meatType);

      _currentFood.record.carbs = calculateCarbsComponent(
          meat: convertInput(meatQuantity),
          milk: convertInput(milkQuantity),
          vegetable: convertInput(vegetableQuantity),
          rice: convertInput(riceQuantity),
          meattype: meatType);

      _currentFood.record.protein = calculateProteinComponent(
          meat: convertInput(meatQuantity),
          milk: convertInput(milkQuantity),
          vegetable: convertInput(vegetableQuantity),
          rice: convertInput(riceQuantity),
          meattype: meatType);

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

      _currentFood.setCurrentRiceQuanity(convertInput(riceQuantity));

      return Feedback(
          title: 'Success', details: 'Calculating components is successful.');
    } on PlatformException catch (e) {
      return Feedback(title: 'Failed', details: e.message);
    }
  }

  bool hasMeat = false, hasMilk = false, hasVegetable = false;

  String _meatType = 'Low';
  String get meatType => _meatType;
  setMeatType(String input) {
    _meatType = input;
    notifyListeners();
  }

  String _meatQuantity = '';
  String get meatQuantity => _meatQuantity;
  setMeatQuantity(String input) => _meatQuantity = input;

  String _riceQuantity = '';
  String get riceQuantity => _riceQuantity;
  setRiceQuantity(String input) => _riceQuantity = input;

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
