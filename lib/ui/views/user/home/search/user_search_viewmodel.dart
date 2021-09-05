import 'package:flutter/services.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_record_service.dart';
import 'package:stacked/stacked.dart';

class UserSearchViewModel extends BaseViewModel {
  final _currentRecord = CurrentRecordService.instance;

  // String _input = '';
  // String get input => _input;
  // void setInput(String value) => _input = value;
  List<Record> userRecordList = [];
  List<Record> searchResult = [];

  void searchUsers(String value) {
    if (value.isNotEmpty) {
      setBusy(true);
      try {
        getSearchRecordResult(value);

        notifyListeners();
        setBusy(false);
      } on PlatformException catch (e) {
        print(e.message);
      }
    }
  }

  void getSearchRecordResult(String searchFilter) {
    searchResult.clear();
    userRecordList = _currentRecord.recordList;

    userRecordList.forEach((record) {
      if (record.title.contains(searchFilter)) {
        searchResult.add(record);
      }
    });
  }
}
