import 'dart:io';

import 'package:flutter/services.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';

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
}
