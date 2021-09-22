import 'dart:io';

import 'package:flutter/services.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert' show utf8;

class RecordViewModel extends BaseViewModel {
  final _database = DatabaseService.instance;
  final _user = CurrentUserService.instance;

  String _title = '';
  String _pictureUrl = '';
  String get title => _title;
  String get pictureUrl => _pictureUrl;
  void setTitle(String value) => _title = value;
  void setPictureUrl(String value) => _pictureUrl = value;

  void inputClear() => {
        _title = '',
        _pictureUrl = '',
      };

  String generatedPostId({String posterEmail, String time}) =>
      posterEmail + time;

  String _imagePath = '';
  String get imagePath => _imagePath;
  void imagePathClear() => _imagePath = '';

  File _selectedImage;
  void selectedImageClear() => _selectedImage.delete();

  void fileReset() {
    inputClear();
    imagePathClear();
    if (_selectedImage != null) selectedImageClear();
  }

  Future<void> addImage() async {
    setBusy(true);
    try {
      File _image = await _database.getImage();
      print(uploadFileToApi(_image));
      _imagePath = _image.path;
      _selectedImage = _image;
      notifyListeners();
    } on PlatformException {
      // _dialog.showDialog(title: 'Profile', description: e.message);
    } catch (e) {}
    setBusy(false);
  }

  Future<void> proceedRecord() async {
    if (_title.isNotEmpty && _selectedImage != null) {
      setBusy(true);
      String date = DateTime.now().toIso8601String();
      String _recordId = generatedPostId(posterEmail: _user.email, time: date);

      String _pictureDownloadUrl = "";
      if (_selectedImage != null) {
        _pictureDownloadUrl = await _database.uploadPostPicture(
            image: _selectedImage, recordId: _recordId);
      }

      _database.setRecord(
          record: Record(
        userEmail: _user.email,
        recordId: _recordId,
        title: _title,
        pictureUrl: _pictureDownloadUrl,
        date: date,
        carbs: 5,
        protein: 5,
        fats: 5,
      ));

      Profile currentProfileInfo;
      await _database
          .profileFuture(email: _user.email)
          .then((value) => currentProfileInfo = value.first);

      _database.setProfile(
          currentProfileInfo.copyWith(records: currentProfileInfo.records + 1));

      fileReset();
      notifyListeners();
      setBusy(false);
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

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }
}
