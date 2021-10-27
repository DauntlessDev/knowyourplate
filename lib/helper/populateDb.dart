import 'package:knowyourplate/model/ingredient.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:stacked/stacked.dart';

class PopulateDb extends BaseViewModel {
  final _database = DatabaseService.instance;

  List<Record> recordList = [
    Record(
      recordId: "rom@gmail.com2021-10-22T16:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
          "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-22T16:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //TODO: add more records here

    //chua
    //09-26
    Record(
      recordId: "rom@gmail.com2021-09-26T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-26T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-09-26T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-09-26T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //09-27
    Record(
      recordId: "rom@gmail.com2021-09-27T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-278T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-09-27T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-27T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //09-28
    Record(
      recordId: "rom@gmail.com2021-09-28T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-28T12:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-09-28T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-28T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //09-29
    Record(
      recordId: "rom@gmail.com2021-09-29T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-09-29T12:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-09-29T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-29T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //09-30
    Record(
      recordId: "rom@gmail.com2021-09-30T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-30T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-09-30T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-09-30T20:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    //10-01
    Record(
      recordId: "rom@gmail.com2021-10-01T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-01T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-01T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-01T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //10-02
    Record(
      recordId: "rom@gmail.com2021-10-02T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-02T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-02T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-02T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //10-03
    Record(
      recordId: "rom@gmail.com2021-10-03T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-03T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-03T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-03T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //10-04
    Record(
      recordId: "rom@gmail.com2021-10-04T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-04T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-04T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-04T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-05
    Record(
      recordId: "rom@gmail.com2021-10-05T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-05T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-05T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-05T20:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    //10-06
    Record(
      recordId: "rom@gmail.com2021-10-06T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-06T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-25T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-06T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //10-07
    Record(
      recordId: "rom@gmail.com2021-10-07T08:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-07T08:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-07T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-07T12:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-07T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-07T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),



    //yuwi
    //10-22
    Record(
      recordId: "rom@gmail.com2021-10-22T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-22T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-22T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-22T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //10-08

    Record(
      recordId: "rom@gmail.com2021-10-08T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-08T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-08T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-08T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-09

    Record(
      recordId: "rom@gmail.com2021-10-09T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-09T12:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-09T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-09T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-10
    Record(
      recordId: "rom@gmail.com2021-10-10T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-10T12:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-10T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-10T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-11
    Record(
      recordId: "rom@gmail.com2021-10-11T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-11T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-11T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-11T20:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    //10-12
    Record(
      recordId: "rom@gmail.com2021-10-12T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-12T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-12T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-12T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //10-13
    Record(
      recordId: "rom@gmail.com2021-10-13T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-13T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-15
    Record(
      recordId: "rom@gmail.com2021-10-15T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-15T12:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-15T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-15T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-18

    Record(
      recordId: "rom@gmail.com2021-10-18T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-18T20:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    //10-19
    Record(
      recordId: "rom@gmail.com2021-10-19T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-19T12:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-19T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-19T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-20
    Record(
      recordId: "rom@gmail.com2021-10-20T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-20T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-21
    Record(
      recordId: "rom@gmail.com2021-10-21T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-21T12:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-21T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-21T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-25
    Record(
      recordId: "rom@gmail.com2021-10-25T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "pinakbet",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-18T13%3A29%3A11.717793.jpg?alt=media&token=baf91229-9328-4c3f-b42f-7813513e422d",
      date: "2021-10-25T12:08:19.338680",
      carbs: 52,
      protein: 22,
      fats: 2,
      ingredients: [
        Ingredient(name: "meat", quantity: 2),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 2),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-25T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "bulalo",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-25T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),

    //10-26
    Record(
      recordId: "rom@gmail.com2021-10-26T12:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-26T12:08:19.338680",
      carbs: 6,
      protein: 42,
      fats: 37.5,
      ingredients: [
        Ingredient(name: "meat", quantity: 5),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 0),
      ],
    ),

    Record(
      recordId: "rom@gmail.com2021-10-26T20:08:19.338680",
      userEmail: "rom@gmail.com",
      title: "sinigang",
      pictureUrl:
      "https://firebasestorage.googleapis.com/v0/b/knowyourplate-4790c.appspot.com/o/posts%2From%40gmail.com2021-10-23T16%3A08%3A19.338680.jpg?alt=media&token=22b3c6ef-0fac-4dfb-9468-928110f8d00f",
      date: "2021-10-26T20:08:19.338680",
      carbs: 26,
      protein: 11,
      fats: 1,
      ingredients: [
        Ingredient(name: "meat", quantity: 1),
        Ingredient(name: "vegetables", quantity: 2),
        Ingredient(name: "rice", quantity: 1),
      ],
    ),
  ];

  void populateRom() {
    for (Record recordItem in recordList) {
      _database.setRecord(record: recordItem);
    }
  }
}
