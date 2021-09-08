//view class
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/record.dart';
import 'package:knowyourplate/ui/widgets/smart_widgets/user/userrecord_tile.dart';
import '../../avatar.dart';
import '../../empty_content.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({
    Key key,
    @required this.profile,
    @required this.userRecordList,
  }) : super(key: key);

  final Profile profile;
  final List<Record> userRecordList;

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  void dispose() {
    // final _visitProfile = locator<VisitProfileService>();
    // _visitProfile.removeVisitProfileEmail();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 7, 7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Align(
              child: _ProfileHeader(
                profile: widget.profile,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.pages),
                Text(' Posts'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: SizedBox(
              height: 1,
            ),
          ),
          OwnPostListBuilder(
            ownRecordList: widget.userRecordList,
          ),
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
            title: 'Empty Posts',
            message: 'The user don\'t have any post.',
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

class _ProfileHeader extends StatelessWidget {
  _ProfileHeader({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Avatar(photoUrl: '', radius: 40),
            constraints: BoxConstraints(minWidth: 100),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  profile.displayName ?? '',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(profile.email,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('Occupation: ${profile.occupation[0].toUpperCase()}${profile.occupation.substring(1)}',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('History: ${profile.familyHealthHistory}',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
