import 'dart:io';

import 'package:flutter/services.dart';
import 'package:knowyourplate/model/feedback.dart';
import 'package:knowyourplate/model/food.dart';
import 'package:knowyourplate/model/ingredient.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/state_services/current_food_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';

import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

class UserHomeViewModel extends BaseViewModel {
  final _database = DatabaseService.instance;
  final _user = CurrentUserService.instance;
  final _food = CurrentFoodService.instance;

  TabItem _currentTab = TabItem.profile;
  TabItem get currentTab => _currentTab;

  void select(TabItem value, navigatorKeyValue) {
    _currentTab = value;
    notifyListeners();
  }

  String generatedPostId({String posterEmail, String time}) =>
      posterEmail + time;

  Feedback result;

  String _imagePath = '';
  String get imagePath => _imagePath;
  void imagePathClear() => _imagePath = '';

  File _selectedImage;
  void selectedImageClear() => _selectedImage.delete();

  Future<Feedback> captureImage() async {
    setBusy(true);
    try {
      File _image = await _database.getImage();

      Food foodresult = Food.fromJson(await (fakeUploadToApi(_image)));

      if (foodresult != null) {
        _imagePath = _image.path;
        _selectedImage = _image;

        String date = DateTime.now().toIso8601String();
        String _recordId =
            generatedPostId(posterEmail: _user.email, time: date);

        String _pictureDownloadUrl = "";
        if (_selectedImage != null) {
          _pictureDownloadUrl = await _database.uploadPostPicture(
              image: _selectedImage, recordId: _recordId);
        }

        List<Ingredient> listOfIngredients = foodresult.components
            .map((component) => Ingredient(name: component, quantity: 0))
            .toList();

        await _food.updateCurrentFoodInfo(Record(
            recordId: _recordId,
            userEmail: _user.email,
            title: foodresult.foodname,
            pictureUrl: _pictureDownloadUrl,
            date: date,
            carbs: 0,
            protein: 0,
            fats: 0,
            ingredients: listOfIngredients));
      }
      notifyListeners();
      setBusy(false);
      return Feedback(
          title: 'Success', details: 'Image is successfully classified.');
    } on PlatformException {
      setBusy(false);
      return Feedback(
          title: 'Failed', details: 'Image classification has failed.');
    }
  }

  uploadFileToApi(File imageFile) async {
    // open a bytestream
    var stream =
        // ignore: deprecated_member_use
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri =
        Uri.parse("https://pc-filipino-food-classifier.herokuapp.com/predict");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('img', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response);
    print(response.statusCode);

    // return response
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    print(responseString);
    return responseString;
  }

  fakeUploadToApi(File imageFile) async {
    return '{"prediction": {"components": [ "meat","vegetables"], "food":"sinigang"}}';
  }
}

enum TabItem { profile, stats, search, prediction }
