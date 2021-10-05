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

  String intensity = 'moderate';

  computeTotalComponents(int divisor) {
    double totalCarbs = 0;
    double totalProtein = 0;
    double totalFats = 0;

    int count = 0;

    while (count != divisor) {
      totalCarbs += _currentRecord.recordList[count].carbs;
      totalProtein += _currentRecord.recordList[count].protein;
      totalFats += _currentRecord.recordList[count].fats;
      count += 1;
    }

    aveCarbs = totalCarbs / divisor;
    aveProtein = totalProtein / divisor;
    aveFats = totalFats / divisor;
  }

  Future<Result> predictThreeDay() async {
    computeTotalComponents(3);
    return await _database.predictDisease(
        carbs: aveCarbs,
        protein: aveProtein,
        fats: aveFats,
        intensity: intensity);
  }

  Future<Result> predictWeekly() async {
    computeTotalComponents(7);
    return await _database.predictDisease(
        carbs: aveCarbs, protein: aveProtein, fats: aveFats);
  }

  Future<Result> predictMonthly() async {
    computeTotalComponents(30);
    return await _database.predictDisease(
        carbs: aveCarbs, protein: aveProtein, fats: aveFats);
  }

  int get recordcount => _currentRecord.recordList.length;
}
