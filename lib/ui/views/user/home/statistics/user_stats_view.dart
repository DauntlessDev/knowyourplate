import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/statistics/stats_content.dart';
import 'package:knowyourplate/ui/views/user/home/statistics/user_stats_viewmodel.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stacked/stacked.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UserStatsView extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserStatsViewModel>.reactive(
      builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.isBusy ||
              model.profile == null ||
              model.profile.email == '',
          child:
              model.isBusy || model.profile == null || model.profile.email == ''
                  ? Container()
                  : _MainContent()),
      viewModelBuilder: () => UserStatsViewModel(),
    );
  }
}

class _MainContent extends ViewModelWidget<UserStatsViewModel> {
  const _MainContent({
    Key key,
  }) : super(key: key, reactive: true);

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
      body: SafeArea(
        child: StatsContent(),
      ),
    );
  }
}

class GroupedBarChart extends ViewModelWidget<UserStatsViewModel> {
  const GroupedBarChart({Key key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, UserStatsViewModel model) {
    return charts.BarChart(
      model.seriesList,
      animate: false,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }
}
