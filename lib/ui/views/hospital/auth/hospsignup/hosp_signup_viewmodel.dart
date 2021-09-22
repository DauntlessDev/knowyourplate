import 'package:flutter/services.dart';
import 'package:knowyourplate/model/hospital.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/user.dart';
import 'package:knowyourplate/services/functional_services/auth_service.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:stacked/stacked.dart';

class HospSignupViewModel extends BaseViewModel {
  final _auth = AuthenticationService.instance;
  final _database = DatabaseService.instance;

  String _hospName = "";
  String _adminName = "";
  String _address = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  String get hospName => _hospName;
  String get adminName => _adminName;
  String get address => _address;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void setHospName(String input) => _hospName = input;
  void setAdminName(String input) => _adminName = input;
  void setAddress(String input) => _address = input;
  void setEmail(String input) => _email = input;
  void setPassword(String input) => _password = input;
  void setConfirmPassword(String input) => _confirmPassword = input;

  void clearInputs() {
    _hospName = "";
    _email = "";
    _password = "";
    _confirmPassword = "";
    _adminName = "";
    _address = "";
  }

  Future<bool> signUpWithEmail() async {
    try {
      if (_hospName.isEmpty ||
          _email.isEmpty ||
          _adminName.isEmpty ||
          _address.isEmpty ||
          _password.isEmpty ||
          _confirmPassword.isEmpty) {
        throw PlatformException(
            code: 'EMPTY_FIELDS', message: 'Please fill out all fields.');
      } else if (_password != _confirmPassword) {
        throw PlatformException(
            code: 'PASSWORD_NOT_EQUAL', message: 'Password does not match.');
      } else if (_hospName.length < 5) {
        throw PlatformException(
            code: 'NAME_TOO_SHORT',
            message: 'Hospital Name is too short, please change.');
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

        await _database.setHospital(
          Hospital(
            uid: user.uid,
            email: _email,
            photoUrl: '',
            hospName: _hospName,
            caseSearch: setSearchParam(_hospName.toLowerCase()),
            patients: 0,
            adminName: _adminName,
            address: _address,
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
