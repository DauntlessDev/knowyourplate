import 'package:flutter/cupertino.dart';
import 'package:knowyourplate/model/record.dart';

class CurrentFoodService extends ChangeNotifier {
  CurrentFoodService._();
  static final instance = CurrentFoodService._();

  Record _record;
  Record get record => _record;

  setCurrentMeatQuanity(double input) => _record.ingredients
      .where((element) => element.name == 'meat')
      .first
      .quantity = input;

  setCurrentVegetableQuanity(double input) => _record.ingredients
      .where((element) => element.name == 'vegetables')
      .first
      .quantity = input;

  setCurrentMilkQuanity(double input) => _record.ingredients
      .where((element) => element.name == 'milk')
      .first
      .quantity = input;
      

  Future<void> updateCurrentFoodInfo(Record record) async {
    print('current food to record $record');
    _record = record;

    notifyListeners();
  }

  void foodInfoReset() {
    _record = null;
  }
}
