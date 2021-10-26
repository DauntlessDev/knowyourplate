import 'package:knowyourplate/model/ingredient.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:stacked/stacked.dart';

class PopulateDb extends BaseViewModel {
  final _database = DatabaseService.instance;

  List<Record> recordList = [
    Record(
      recordId: "rom@gmail.com2021-10-23T16:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
          "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-23T16:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    )
  ];

  void populateRom() {
    for (Record recordItem in recordList) {
      _database.setRecord(record: recordItem);
    }
  }
}
