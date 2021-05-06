//view class

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/search/user_search_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
          UserRecord(
            title: 'Green Light Weight Dress',
            date: 'Nov 28, 2021',
          ),
        ],
      ),
    );
  }
}

class UserRecord extends StatelessWidget {
  const UserRecord({
    Key key,
    @required this.title,
    @required this.date,
  }) : super(key: key);

  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
      child: Card(
        child: Column(
          children: [
            // Image(image: AssetImage(pictureUrl)),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              date,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
