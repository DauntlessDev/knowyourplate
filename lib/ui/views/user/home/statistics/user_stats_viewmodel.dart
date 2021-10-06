import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/services/functional_services/database_service.dart';
import 'package:knowyourplate/services/state_services/current_user_service.dart';
import 'package:stacked/stacked.dart';

class UserStatsViewModel extends StreamViewModel<Profile> {
  final _database = DatabaseService.instance;
  final _user = CurrentUserService.instance;

  Stream<List<Record>> ownRecordStream() =>
      _database.specificRecordStream(_user.email);

  Stream<Profile> profileStream() => _database.profileStream();
  List<Record> ownRecordList = [];

  @override
  Stream<Profile> get stream {
    ownRecordStream().listen((event) {
      if (event != null) {
        print('ownPOstsLsist email : ${_user.email}');
        print('ownPOstsLsist event : $event');
        ownRecordList = event;
        notifyListeners();
      }
    });

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
