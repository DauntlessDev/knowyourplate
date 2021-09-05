import 'package:flutter/cupertino.dart';
import 'package:knowyourplate/model/record.dart';

class CurrentRecordService extends ChangeNotifier {
  CurrentRecordService._();
  static final instance = CurrentRecordService._();


  List<Record> _recordList;
  List<Record> get recordList => _recordList;

  void updateCurrentUserRecordList(List<Record> records) {
    _recordList = records;
    notifyListeners();
  }

}
