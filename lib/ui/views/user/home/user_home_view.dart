//view class
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowyourplate/ui/views/user/home/profile/user_profile_view.dart';
import 'package:knowyourplate/ui/views/user/home/record/record_view.dart';
import 'package:knowyourplate/ui/views/user/home/request/user_request_view.dart';
import 'package:knowyourplate/ui/views/user/home/search/user_search_view.dart';
import 'package:knowyourplate/ui/views/user/home/statistics/user_stats_view.dart';
import 'package:knowyourplate/ui/views/user/home/user_home_viewmodel.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

class UserHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserHomeViewModel>.reactive(
      viewModelBuilder: () => UserHomeViewModel(),
      // onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.receipt_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecordView()),
              );
            },
          ),
        ),
        body: _CupertinoHomeScaffold(
            currentTab: model.currentTab,
            onSelectTab: model.select,
            widgetBuilders: _TabItemData.widgetBuilders,
            navigatorKey: _TabItemData.navigatorKey),
      ),
    );
  }
}

class _CupertinoHomeScaffold extends StatelessWidget {
  final TabItem currentTab;
  final Function onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKey;

  _CupertinoHomeScaffold(
      {Key key,
      @required this.currentTab,
      @required this.onSelectTab,
      @required this.widgetBuilders,
      @required this.navigatorKey,
      // ignore: unused_element
      CupertinoTabBar builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        backgroundColor: Colors.white,
        items: [
          _buildItem(TabItem.profile),
          _buildItem(TabItem.stats),
          _buildItem(TabItem.search),
          _buildItem(TabItem.request),
        ],
        onTap: (index) =>
            onSelectTab(TabItem.values[index], navigatorKey[index]),
      ),
      tabBuilder: (BuildContext context, int index) {
        final item = TabItem.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKey[item],
          builder: (context) => widgetBuilders[item](context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = _TabItemData.allData[tabItem];
    final color = currentTab == tabItem ? Colors.green : Colors.grey;

    return BottomNavigationBarItem(
      icon: Icon(
        itemData.icon,
        color: color,
      ),
    );
  }
}

class _TabItemData {
  const _TabItemData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItem, _TabItemData> allData = {
    TabItem.profile: _TabItemData(
      title: 'Profile',
      icon: MdiIcons.accountOutline,
    ),
    TabItem.stats: _TabItemData(
      title: 'Stats',
      icon: MdiIcons.graphOutline,
    ),
    TabItem.search: _TabItemData(
      title: 'Search',
      icon: Icons.search,
    ),
    TabItem.request: _TabItemData(
      title: 'Request',
      icon: MdiIcons.viewListOutline,
    ),
  };

  static Map<TabItem, GlobalKey<NavigatorState>> get navigatorKey {
    return {
      TabItem.profile: UserProfileView.navigatorKey,
      TabItem.stats: UserStatsView.navigatorKey,
      TabItem.search: UserSearchView.navigatorKey,
      TabItem.request: UserRequestView.navigatorKey,
    };
  }

  static Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.profile: (_) => UserProfileView(),
      TabItem.stats: (_) => UserStatsView(),
      TabItem.search: (_) => UserSearchView(),
      TabItem.request: (_) => UserRequestView(),
    };
  }
}
