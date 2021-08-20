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
              ),
              const Icon(Icons.person),
            ],
          ),
          actions: <Widget>[ProfileMenu()],
        ),
        body: ProfileContent(
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
            displayName: 'Brave Leuterio',
            email: 'braveleuterio@gmail.com',
            photoUrl: '',
            records: 3,
            uid: '12',
          ),
        ));
    // body: Text("Profile"));
  }
}

class ProfileMenu extends ViewModelWidget<UserProfileViewModel> {
  ProfileMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, UserProfileViewModel model) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardColor: Colors.white,
      ),
      child: PopupMenuButton(
        icon: Icon(Icons.menu, color: Colors.white),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<_OptionTile>>[
          PopupMenuItem<_OptionTile>(
            child: _OptionTile(
              option: Option(
                title: 'Logout',
                iconData: Icons.exit_to_app,
                onTap: () => {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Sign-out"),
                      actions: [
                        FlatButton(
                            onPressed: ()  => {
                                  model.signOutTrue(),
                                  Navigator.of(context, rootNavigator: true).pop()
                                },
                            child: Text("Yes")),
                        FlatButton(
                            onPressed: () => {
                                  Navigator.of(context, rootNavigator: true).pop()
                                },
                            child: Text("No"))
                      ],
                    ),
                  )
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//   Future<void> signOutTrue() async {
//     try {
//       DialogResponse decision = await _dialog.showConfirmationDialog(
//         title: 'Log-out',
//         description: 'Are you sure in logging out?',
//         confirmationTitle: 'Confirm',
//         cancelTitle: 'Cancel',
//       );

//       if (decision.confirmed) {
//         await _auth.signOut();
//         _chatlist.clear();
//         _user.updateCurrentUserInfo(User(email: '', uid: ''));
//       }
//     } on PlatformException catch (e) {
//       _dialog.showDialog(
//         title: 'Sign-up Failed',
//         description: e.message,
//       );
//     }
//   }
// }

class Option {
  final String title;
  final IconData iconData;
  final String subTitle;
  final String category;
  final bool isSwitch;
  final Function onTap;

  Option(
      {@required this.title,
      @required this.iconData,
      this.subTitle,
      this.category,
      this.isSwitch = false,
      @required this.onTap});
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({Key key, @required this.option}) : super(key: key);
  final Option option;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        option.iconData,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(option.title),
      onTap: option.onTap,
    );
  }
}
