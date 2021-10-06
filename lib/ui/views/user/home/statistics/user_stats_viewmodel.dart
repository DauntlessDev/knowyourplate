import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/model/user.dart';
import 'package:knowyourplate/services/functional_services/auth_service.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_record_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';

class UserStatsViewModel extends StreamViewModel<Profile> {
  final _auth = AuthenticationService.instance;
  final _database = DatabaseService.instance;
  final _user = CurrentUserService.instance;
  final _currentRecord = CurrentRecordService.instance;

  Future<void> signOutTrue() async {
    await _auth.signOut();
    _user.updateCurrentUserInfo(User(email: '', uid: ''));
  }

  Stream<Profile> profileStream() => _database.profileStream();
  List<Record> ownRecordList = [];

  @override
  Stream<Profile> get stream {
    profileStream().listen((event) {
      if (event != null) {
        // setPosts(ownPostList, event);
      }
    });
    return profileStream();
  }

  Profile get profile {
    return (data == null)
        ? Profile(
            caseSearch: [],
            uid: '',
            photoUrl: '',
            displayName: '',
            email: '',
            records: 0,
            familyHealthHistory: '',
            occupation: '',
          )
        : Profile(
            uid: data.uid,
            photoUrl: data.photoUrl ?? '',
            caseSearch: data.caseSearch,
            email: data.email,
            displayName: data.displayName,
            records: data.records,
            familyHealthHistory: data.familyHealthHistory,
            occupation: data.occupation,
          );
  }
}
