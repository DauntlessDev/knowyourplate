//view class
import 'package:flutter/material.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/recordprofile.dart';
import 'package:knowyourplate/ui/widgets/smart_widgets/user/userrecord_tile.dart';
import '../../avatar.dart';
import '../../empty_content.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({
    Key key,
    @required this.profile,
    @required this.buttonText,
    @required this.buttonColor,
    @required this.onPressed,
    @required this.userRecordList,
  }) : super(key: key);

  final Profile profile;
  final String buttonText;
  final Color buttonColor;
  final Function onPressed;
  final List<RecordProfile> userRecordList;

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
            child: _ProfileHeader(
              buttonText: widget.buttonText,
              onPressed: widget.onPressed,
              profile: widget.profile,
              buttonColor: widget.buttonColor,
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
            buttonColor: widget.buttonColor,
            buttonText: widget.buttonText,
            onPressed: widget.onPressed,
            profile: widget.profile,
          ),
        ],
      ),
    );
  }
}

class OwnPostListBuilder extends StatelessWidget {
  const OwnPostListBuilder({
    Key key,
    @required this.profile,
    @required this.buttonText,
    @required this.buttonColor,
    @required this.onPressed,
    @required this.ownRecordList,
  }) : super(key: key);

  final List<RecordProfile> ownRecordList;

  final Profile profile;
  final String buttonText;
  final Color buttonColor;
  final Function onPressed;

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
          return UserRecord(recordProfile: ownRecordList[index - 1]);
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
    @required this.buttonText,
    @required this.buttonColor,
    @required this.onPressed,
  }) : super(key: key);

  final Profile profile;
  final String buttonText;
  final Color buttonColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Avatar(photoUrl: '', radius: 50),
            const SizedBox(height: 20),
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
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
            ),
          ],
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      color: onPressed == null ? Colors.grey : buttonColor,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(3.0))),
                  child: TextButton(
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
