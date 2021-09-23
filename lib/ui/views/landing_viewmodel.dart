import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:knowyourplate/model/user.dart';
import 'package:knowyourplate/services/functional_services/auth_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
// import 'package:knowyourplate/services/state_services/visit_profile_service.dart';

class LandingViewModel extends StreamViewModel<User> {
  final _auth = AuthenticationService.instance;
  final _user = CurrentUserService.instance;

  User get user => data;
  Stream<User> onAuthStateChanged() {
    _auth.onAuthStateChanged.listen((event) async {
      try {
        if (event != null) {
          _user.updateCurrentUserInfo(event);
        }
      } on PlatformException catch (e) {
        print('landing page updating user field: ${e.message}');
      }
    });
    return _auth.onAuthStateChanged;
  }

  @override
  Stream<User> get stream => onAuthStateChanged();
}
