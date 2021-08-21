import 'package:flutter/services.dart';
import 'package:knowyourplate/services/functional_services/auth_service.dart';
import 'package:stacked/stacked.dart';

class UserLoginViewModel extends BaseViewModel {
  final _auth = AuthenticationService.instance;

  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  void setEmail(String input) => _email = input;
  void setPassword(String input) => _password = input;

  Future<bool> signInWithEmail() async {
    try {
      if (_email.isNotEmpty && _password.isNotEmpty) {
        setBusy(true);
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        setBusy(false);
        return true;
      } else {
        throw PlatformException(
            code: 'EMPTY_FIELDS', message: 'Please fill out all fields.');
      }
    } on PlatformException catch (e) {
      // await _dialog.showDialog(title: 'Login Failed', description: e.message);
      setBusy(false);
      return false;
    } 
  }
}
