import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/model/result.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_record_service.dart';
import 'package:stacked/stacked.dart';

class PredictionViewModel extends BaseViewModel {
  final _currentRecord = CurrentRecordService.instance;
  final _database = DatabaseService.instance;

  Result result;

  double aveCarbs = 0;
  double aveProtein = 0;
  double aveFats = 0;

  String _intensity = 'Low';
  String get intensity => _intensity;
  setIntensity(String input) {
    _intensity = input;
    notifyListeners();
  }

  DateTime dateOfFirstRecord;
  List<Record> recordlist;
  bool hasRecords;
  initialize() {
    setBusy(true);
    try {
      recordlist = _currentRecord.recordList;
      dateOfFirstRecord = DateTime.parse(_currentRecord.recordList.last.date);
      hasRecords = true;
    } catch (e) {
      hasRecords = false;
      print('no record to be checked');
    }
    notifyListeners();
    setBusy(false);
  }

  bool checkIfAvailable(int dateDifference) {
    if (hasRecords) {
      return (dateOfFirstRecord.difference(DateTime.now()).abs() >=
          Duration(days: dateDifference));
    } else {
      return false;
    }
  }

  computeTotalComponents(int dateDifference) {
    double totalCarbs = 0;
    double totalProtein = 0;
    double totalFats = 0;

    int count = 0;

    List<Record> filteredRecordList =
        _currentRecord.recordList.where((element) {
      DateTime elementDate = DateTime.parse(element.date);
      return elementDate.difference(DateTime.now()).abs() >=
          Duration(days: dateDifference - 1);
    }).toList();

    print('filterRecord: $filteredRecordList');

    while (count != filteredRecordList.length) {
      totalCarbs += _currentRecord.recordList[count].carbs;
      totalProtein += _currentRecord.recordList[count].protein;
      totalFats += _currentRecord.recordList[count].fats;
      count += 1;
    }

    aveCarbs = totalCarbs / dateDifference;
    aveProtein = totalProtein / dateDifference;
    aveFats = totalFats / dateDifference;
  }

  Future<Result> predictThreeDay() async {
    setBusy(true);
    computeTotalComponents(3);
    Result result = await _database.predictDisease(
        carbs: aveCarbs,
        protein: aveProtein,
        fats: aveFats,
        intensity: _intensity.toLowerCase());

    setBusy(false);
    return result;
  }

  Future<Result> predictWeekly() async {
    setBusy(true);
    computeTotalComponents(7);
    Result result = await _database.predictDisease(
        carbs: aveCarbs,
        protein: aveProtein,
        fats: aveFats,
        intensity: _intensity.toLowerCase());
    setBusy(false);
    return result;
  }

  Future<Result> predictMonthly() async {
    setBusy(true);
    computeTotalComponents(30);
    Result result = await _database.predictDisease(
        carbs: aveCarbs,
        protein: aveProtein,
        fats: aveFats,
        intensity: _intensity.toLowerCase());
    setBusy(false);
    return result;
  }

  int get recordcount => _currentRecord.recordList.length;
}
