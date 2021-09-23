import 'package:flutter/services.dart';
import 'package:knowyourplate/model/feedback.dart';
import 'package:knowyourplate/services/functional_services/auth_service.dart';
import 'package:stacked/stacked.dart';

class UserLoginViewModel extends BaseViewModel {
  Feedback result;
  final _auth = AuthenticationService.instance;

  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  void setEmail(String input) => _email = input;
  void setPassword(String input) => _password = input;

  Future<Feedback> signInWithEmail() async {
    try {
      if (_email.isNotEmpty && _password.isNotEmpty) {
        setBusy(true);
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        setBusy(false);
        return Feedback(
            title: 'Login Success', details: 'You have successfully login.');
      } else {
        throw PlatformException(
            code: 'EMPTY_FIELDS', message: 'Please fill out all fields.');
      }
    } on PlatformException catch (e) {
      setBusy(false);
      return Feedback(title: 'Login Failed', details: e.message);
    }
  }
}
