import 'package:charts_flutter/flutter.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_record_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UserStatsViewModel extends StreamViewModel<Profile> {
  final _database = DatabaseService.instance;
  final _user = CurrentUserService.instance;
  final _currentRecord = CurrentRecordService.instance;

  Stream<List<Record>> ownRecordStream() =>
      _database.specificRecordStream(_user.email);

  Stream<Profile> profileStream() => _database.profileStream();

  List<Record> ownRecordList = [];
  List<Series<Ordinalamount, String>> seriesList = [];
  initialize() {
    // ownRecordList = _currentRecord.recordList;
    seriesList = _createSampleData();
    notifyListeners();
  }

  @override
  Stream<Profile> get stream {
    ownRecordStream().listen((event) {
      if (event != null) {
        print('ownPOstsLsist email : ${_user.email}');
        print('ownPOstsLsist event : $event');
        ownRecordList = event;
        initialize();
        notifyListeners();
      }
    });

    profileStream().listen((event) {
      if (event != null) {
        // setPosts(ownPostList, event);
      }
    });
    return profileStream();
  }

  Profile get profile {
    return (data == null)
        ? Profile(
            caseSearch: [],
            uid: '',
            photoUrl: '',
            displayName: '',
            email: '',
            records: 0,
            familyHealthHistory: '',
            occupation: '',
          )
        : Profile(
            uid: data.uid,
            photoUrl: data.photoUrl ?? '',
            caseSearch: data.caseSearch,
            email: data.email,
            displayName: data.displayName,
            records: data.records,
            familyHealthHistory: data.familyHealthHistory,
            occupation: data.occupation,
          );
  }

  List<charts.Series<Ordinalamount, String>> _createSampleData() {
    List<Ordinalamount> dayOne = [];
    List<Ordinalamount> dayTwo = [];
    List<Ordinalamount> dayThree = [];

    int count = 0;
    if (ownRecordList.length == 1) {
      while (count != ownRecordList.length) {
        if (count == 0) {
          dayOne.add(
              new Ordinalamount('carbs', ownRecordList[count].carbs.toInt()));
          dayOne.add(new Ordinalamount(
              'protein', ownRecordList[count].protein.toInt()));
          dayOne.add(
              new Ordinalamount('fats', ownRecordList[count].fats.toInt()));
        }
        count += 1;
      }
      return [
        new charts.Series<Ordinalamount, String>(
          id: 'Day 1',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayOne,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.darker,
        ),
      ];
    } else if (ownRecordList.length == 2) {
      while (count != ownRecordList.length) {
        if (count == 0) {
          dayOne.add(
              new Ordinalamount('carbs', ownRecordList[count].carbs.toInt()));
          dayOne.add(new Ordinalamount(
              'protein', ownRecordList[count].protein.toInt()));
          dayOne.add(
              new Ordinalamount('fats', ownRecordList[count].fats.toInt()));
        }
        if (count == 1) {
          dayTwo.add(
              new Ordinalamount('carbs', ownRecordList[count].carbs.toInt()));
          dayTwo.add(new Ordinalamount(
              'protein', ownRecordList[count].protein.toInt()));
          dayTwo.add(
              new Ordinalamount('fats', ownRecordList[count].fats.toInt()));
        }

        count += 1;
      }
      return [
        new charts.Series<Ordinalamount, String>(
          id: 'Day 1',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayOne,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.darker,
        ),
        new charts.Series<Ordinalamount, String>(
          id: 'Day 2',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayTwo,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        )
      ];
    } else {
      while (count != 3) {
        if (count == 0) {
          dayOne.add(
              new Ordinalamount('carbs', ownRecordList[count].carbs.toInt()));
          dayOne.add(new Ordinalamount(
              'protein', ownRecordList[count].protein.toInt()));
          dayOne.add(
              new Ordinalamount('fats', ownRecordList[count].fats.toInt()));
        } else if (count == 1) {
          dayTwo.add(
              new Ordinalamount('carbs', ownRecordList[count].carbs.toInt()));
          dayTwo.add(new Ordinalamount(
              'protein', ownRecordList[count].protein.toInt()));
          dayTwo.add(
              new Ordinalamount('fats', ownRecordList[count].fats.toInt()));
        } else if (count == 2) {
          dayThree.add(
              new Ordinalamount('carbs', ownRecordList[count].carbs.toInt()));
          dayThree.add(new Ordinalamount(
              'protein', ownRecordList[count].protein.toInt()));
          dayThree.add(
              new Ordinalamount('fats', ownRecordList[count].fats.toInt()));
        }

        count += 1;
      }

      return [
        new charts.Series<Ordinalamount, String>(
          id: 'Day 1',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayOne,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.darker,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.darker,
        ),
        new charts.Series<Ordinalamount, String>(
          id: 'Day 2',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayTwo,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        ),
        new charts.Series<Ordinalamount, String>(
          id: 'Day 3',
          domainFn: (Ordinalamount amount, _) => amount.nutrientName,
          measureFn: (Ordinalamount amount, _) => amount.amount,
          data: dayThree,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.lighter,
        ),
      ];
    }
  }
}

class Ordinalamount {
  final String nutrientName;
  final int amount;

  Ordinalamount(this.nutrientName, this.amount);
}
