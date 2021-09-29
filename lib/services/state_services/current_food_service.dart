import 'package:flutter/cupertino.dart';
import 'package:knowyourplate/model/record.dart';

class CurrentFoodService extends ChangeNotifier {
  CurrentFoodService._();
  static final instance = CurrentFoodService._();

  Record _record;
  Record get record => _record;

  Future<void> updateCurrentFoodInfo(Record record) async {
    print('current food to record $record');
    _record = record;

    notifyListeners();
  }

  void foodInfoReset() {
    _record = null;
  }
}
