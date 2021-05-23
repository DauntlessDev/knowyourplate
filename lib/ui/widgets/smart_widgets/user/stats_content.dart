import 'package:flutter/material.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/model/recordprofile.dart';
import 'package:knowyourplate/ui/widgets/smart_widgets/user/charts/groupedbarchart.dart';
import '../../avatar.dart';

class StatsContent extends StatefulWidget {
  const StatsContent({
    Key key,
    @required this.profile,
    @required this.userRecordList,
  }) : super(key: key);

  final Profile profile;
  final List<RecordProfile> userRecordList;

  @override
  _StatsContentState createState() => _StatsContentState();
}

class _StatsContentState extends State<StatsContent> {
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
              profile: widget.profile,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: <Widget>[
                Icon(Icons.bar_chart),
                Text(' Charts'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: SizedBox(
              height: 1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 500,
                child: GroupedBarChart.withSampleData(),
              ),
            ),
          ),
        ],
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        )
      ],
    );
  }
}
