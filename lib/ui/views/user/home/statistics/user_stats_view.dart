import 'package:flutter/material.dart';
import 'package:knowyourplate/model/profile.dart';
import 'package:knowyourplate/ui/views/user/home/statistics/user_stats_viewmodel.dart';
import 'package:knowyourplate/ui/widgets/smart_widgets/user/stats_content.dart';
import 'package:stacked/stacked.dart';

class UserStatsView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserStatsViewModel>.reactive(
      builder: (context, model, child) => _MainContent(),
      viewModelBuilder: () => UserStatsViewModel(),
    );
  }
}

class _MainContent extends ViewModelWidget<UserStatsViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, UserStatsViewModel model) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          children: [
            Text(
              'Statistics ',
              // style: Theme.of(context).appBarTheme.textTheme.headline1,
            ),
            const Icon(Icons.person),
          ],
        ),
      ),
      body: StatsContent(
        profile: Profile(
          displayName: 'Brave Leuterio',
          email: 'braveleuterio@gmail.com',
          photoUrl: '',
          records: 3,
          uid: '12',
          caseSearch: ['y', 'ye', 'yes'],
        ),
        userRecordList: [],
      ),
    );
  }
}
