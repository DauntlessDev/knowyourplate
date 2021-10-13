import 'package:flutter/material.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/ui/views/user/home/statistics/user_stats_view.dart';
import 'package:knowyourplate/ui/views/user/home/statistics/user_stats_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/avatar.dart';
import 'package:stacked/stacked.dart';

class StatsContent extends ViewModelWidget<UserStatsViewModel> {
  const StatsContent({
    Key key,
  }) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, UserStatsViewModel model) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 7, 7),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: _ProfileHeader(
              profile: model.profile,
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
                child: model.ownRecordList.length == 0
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Not Available"),
                          Text("You currently don't have enough records.",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ))
                    : GroupedBarChart(),
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
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                    'Occupation: ${profile.occupation[0].toUpperCase()}${profile.occupation.substring(1)}',
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text('History: ${profile.familyHealthHistory}',
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.w300)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
