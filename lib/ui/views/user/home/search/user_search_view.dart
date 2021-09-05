//view class

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/ui/views/user/home/search/user_search_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/empty_content.dart';
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
                    onChanged: model.searchUsers,
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      body: Column(
          children: [
            model.userRecordList.isEmpty
                ? Expanded(
                  child: Align(
                    child: Text("Please input the title to start searching."),
                  ),
                )
                : OwnPostListBuilder(ownRecordList: model.searchResult),
          ],
        ),
    );
  }
}

class OwnPostListBuilder extends StatelessWidget {
  const OwnPostListBuilder({
    Key key,
    @required this.ownRecordList,
  }) : super(key: key);

  final List<Record> ownRecordList;

  @override
  Widget build(BuildContext context) {
    print('ownPOstsLsist : ${ownRecordList.isEmpty}');
    if (ownRecordList.isEmpty) {
      return Expanded(
        child: SizedBox(
          height: 500,
          child: EmptyContent(
            title: 'Empty Result',
            message: 'The input does not match any of the records.',
          ),
        ),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container();
          }
          if (index == ownRecordList.length + 1) return Container();
          return UserRecord(record: ownRecordList[index - 1]);
        },
        itemCount: ownRecordList.length + 2,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey,
          thickness: .2,
          height: .2,
        ),
      ),
    );
  }
}
