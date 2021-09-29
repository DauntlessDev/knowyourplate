import 'package:knowyourplate/model/feedback.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_food_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';

class RecordViewModel extends BaseViewModel {
  final _database = DatabaseService.instance;
  final _user = CurrentUserService.instance;
  final _food = CurrentFoodService.instance;

  Feedback result;

  Record _foodInfo;
  Record get foodInfo => _foodInfo;

  void getCurrentFoodInfo() async {
    _foodInfo = _food.record;
  }

  Future<Feedback> proceedRecord() async {
    if (_food.record != null) {
      setBusy(true);
      _database.setRecord(record: _food.record);

      Profile currentProfileInfo;
      await _database
          .profileFuture(email: _user.email)
          .then((value) => currentProfileInfo = value.first);

      _database.setProfile(
          currentProfileInfo.copyWith(records: currentProfileInfo.records + 1));

      notifyListeners();
      _food.foodInfoReset();
      setBusy(false);
      return Feedback(title: 'Success', details: 'New record has been added');
    } else {
      print('error in adding, food record is null');
      return Feedback(
          title: 'Failed', details: 'Adding new record has failed.');
    }
  }

  void cancelRecord() {
    _food.foodInfoReset();
  }
}
