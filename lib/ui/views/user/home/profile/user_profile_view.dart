import 'package:flutter/material.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/model/recordprofile.dart';
import 'package:knowyourplate/ui/views/user/home/profile/user_profile_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/smart_widgets/user/profile_content.dart';
import 'package:stacked/stacked.dart';

class UserProfileView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfileViewModel>.reactive(
      builder: (context, model, child) => _MainContent(),
      viewModelBuilder: () => UserProfileViewModel(),
    );
  }
}

class _MainContent extends ViewModelWidget<UserProfileViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, UserProfileViewModel model) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Row(
            children: [
              Text(
                'Profile ',
                // style: Theme.of(context).appBarTheme.textTheme.headline1,
              ),
              const Icon(Icons.person),
            ],
          ),
        ),
        body: ProfileContent(
          buttonText: 'Change Picture',
          onPressed: () => {},
          userRecordList: [
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
            RecordProfile(
                record: Record(
                    title: 'Sinigang na hipon',
                    date: 'Nov 28, 2021',
                    userEmail: "email",
                    userId: "email",
                    pictureUrl: ''),
                userProfile: Profile(
                  displayName: 'yes',
                  email: 'email',
                  photoUrl: 'qwe',
                  records: 3,
                  uid: '12',
                )),
          ],
          profile: Profile(
            displayName: 'yes',
            email: 'email',
            photoUrl: 'qwe',
            records: 3,
            uid: '12',
          ),
          buttonColor: Theme.of(context).primaryColor,
        ));
    // body: Text("Profile"));
  }
}
