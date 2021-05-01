import 'package:stacked/stacked.dart';

class UserSignupViewModel extends BaseViewModel {
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

  Future signUpWithEmail() async {}
}
