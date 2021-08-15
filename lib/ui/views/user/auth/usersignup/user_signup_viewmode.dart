import 'package:flutter/services.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/user.dart';
import 'package:knowyourplate/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class UserSignupViewModel extends BaseViewModel {
  
  final _auth = AuthenticationService.instance;

  String _displayName = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  String get displayName => _displayName;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void setDisplayName(String input) => _displayName = input;
  void setEmail(String input) => _email = input;
  void setPassword(String input) => _password = input;
  void setConfirmPassword(String input) => _confirmPassword = input;

  void clearInputs() {
    _displayName = "";
    _email = "";
    _password = "";
    _confirmPassword = "";
  }

  Future signUpWithEmail() async { try {
      if (_displayName.isEmpty ||
          _email.isEmpty ||
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

        // setSearchParam(String caseNumber) {
        //   List<String> caseSearchList = List();
        //   String temp = "";
        //   for (int i = 0; i < caseNumber.length; i++) {
        //     temp = temp + caseNumber[i];
        //     caseSearchList.add(temp);
        //   }
        //   return caseSearchList;
        // }

        // await _database.setProfile(
        //   Profile(
        //     uid: user.uid,
        //     email: _email,
        //     photoUrl: '',
        //     displayName: _displayName,
        //     caseSearch: setSearchParam(_displayName.toLowerCase()),
        //     followers: 0,
        //     following: 0,
        //     posts: 0,
        //   ),
        // );
        clearInputs();
        setBusy(false);
        // _navigation.back();
      }
    } on PlatformException catch (e) {
      setBusy(false);
      // await _dialog.showDialog(
      //   title: 'Sign-up Failed',
      //   description: e.message,
      // );
    }
  }

  
}
