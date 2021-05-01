import 'package:stacked/stacked.dart';

class UserLoginViewModel extends BaseViewModel {
  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  void setEmail(String input) => _email = input;
  void setPassword(String input) => _password = input;

  Future signInWithEmail() async {}
}
