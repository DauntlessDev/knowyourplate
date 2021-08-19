import 'package:flutter/cupertino.dart';
import 'package:knowyourplate/model/user.dart';

class CurrentUserService extends ChangeNotifier {
  CurrentUserService._();
  static final instance = CurrentUserService._();

  String _uid;
  String get uid => _uid;

  String _email;
  String get email => _email;

  Future<void> updateCurrentUserInfo(User user) async {
    print('currentUser $user');
    _uid = user.uid;
    _email = user.email;

    notifyListeners();
  }
}
