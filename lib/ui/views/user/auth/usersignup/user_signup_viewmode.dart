import 'package:flutter/services.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/user.dart';
import 'package:knowyourplate/services/functional_services/auth_service.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:stacked/stacked.dart';

class UserSignupViewModel extends BaseViewModel {
  final _auth = AuthenticationService.instance;
  final _database = DatabaseService.instance;

  String _displayName = "";
  String _occupation = "";
  String _familyHealthHistory = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  String get displayName => _displayName;
  String get occupation => _occupation;
  String get familyHealthHistory => _familyHealthHistory;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void setDisplayName(String input) => _displayName = input;
  void setOccupation(String input) => _displayName = input;
  void setfamilyHealthHistory(String input) => _displayName = input;
  void setEmail(String input) => _email = input;
  void setPassword(String input) => _password = input;
  void setConfirmPassword(String input) => _confirmPassword = input;

  void clearInputs() {
    _displayName = "";
    _email = "";
    _password = "";
    _confirmPassword = "";
    _occupation = "";
    _familyHealthHistory = "";
  }

  Future<bool> signUpWithEmail() async {
    try {
      if (_displayName.isEmpty ||
          _email.isEmpty ||
          _occupation.isEmpty ||
          _familyHealthHistory.isEmpty ||
          _password.isEmpty ||
          _confirmPassword.isEmpty) {
        throw PlatformException(
            code: 'EMPTY_FIELDS', message: 'Please fill out all fields.');
      } else if (_password != _confirmPassword) {
        throw PlatformException(
            code: 'PASSWORD_NOT_EQUAL', message: 'Password does not match.');
      } else if (_displayName.length < 5) {
        throw PlatformException(
            code: 'NAME_TOO_SHORT',
            message: 'Name is too short, please change.');
      } else {
        setBusy(true);

        User user = await _auth.createWithEmailAndPassword(
            email: _email, password: _password);

        setSearchParam(String caseNumber) {
          List<String> caseSearchList = [];
          String temp = "";
          for (int i = 0; i < caseNumber.length; i++) {
            temp = temp + caseNumber[i];
            caseSearchList.add(temp);
          }
          return caseSearchList;
        }

        await _database.setProfile(
          Profile(
            uid: user.uid,
            email: _email,
            photoUrl: '',
            displayName: _displayName,
            caseSearch: setSearchParam(_displayName.toLowerCase()),
            records: 0,
            occupation: _occupation,
            familyHealthHistory: _familyHealthHistory,
          ),
        );
        clearInputs();
        setBusy(false);

        return true;
        // _navigation.back();
      }
    } on PlatformException {
      setBusy(false);

      return false;
      // await _dialog.showDialog(
      //   title: 'Sign-up Failed',
      //   description: e.message,
      // );
    }
  }
}
