import 'package:knowyourplate/model/user.dart';
import 'package:knowyourplate/services/functional_services/auth_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';

class UserProfileViewModel extends BaseViewModel {
  final _auth = AuthenticationService.instance;
  final _user = CurrentUserService.instance;
  // final _dialog = locator<DialogService>();

  Future<void> signOutTrue() async {
    await _auth.signOut();
    _user.updateCurrentUserInfo(User(email: '', uid: ''));
  }
}
