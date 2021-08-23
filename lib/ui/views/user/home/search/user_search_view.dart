//view class

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/model/recordprofile.dart';
import 'package:knowyourplate/ui/views/user/home/search/user_search_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/smart_widgets/user/userrecord_tile.dart';
import 'package:stacked/stacked.dart';

class UserSearchView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserSearchViewModel>.reactive(
      builder: (context, model, child) => _MainContent(),
      viewModelBuilder: () => UserSearchViewModel(),
    );
  }
}

class _MainContent extends ViewModelWidget<UserSearchViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, UserSearchViewModel model) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text(
          "Search Records",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        bottom: PreferredSize(
          preferredSize: Size.square(70),
          child: Column(
            children: [
              SizedBox(height: 10),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: ' record title...',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
          UserRecord(
            recordProfile: RecordProfile(
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
                  uid: '12', caseSearch: ['y','ye','yes'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _UserRecord extends ViewModelWidget<UserSearchViewModel> {
//   const _UserRecord({
//     Key key,
//     @required this.title,
//     @required this.pictureUrl,
//     @required this.date,
//   }) : super(key: key, reactive: true);

//   final String title;
//   final String pictureUrl;
//   final String date;

//   @override
//   Widget build(BuildContext context, UserSearchViewModel model) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             children: <Widget>[
//               // Image(
//               //   image: AssetImage(pictureUrl),
//               //   height: 150,
//               //   width: 100,
//               //   fit: BoxFit.fitHeight,
//               // ),
//               Container(
//                 color: Colors.lightGreenAccent,
//                 width: 50,
//                 height: 50,
//               ),
//               SizedBox(width: 15),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(width: 15),
//                   Text(
//                     title.length < 25 ? title : '${title.substring(0, 22)}...',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     date,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 11,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
