//view class
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

import 'hosp_home_viewmodel.dart';
import 'profile/hosp_profile_view.dart';
import 'request/hosp_request_view.dart';
import 'search/hosp_search_view.dart';

class HospHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HospHomeViewModel>.reactive(
      viewModelBuilder: () => HospHomeViewModel(),
      // onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => Scaffold(
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 50),
        //   child: FloatingActionButton(
        //     backgroundColor: Colors.green,
        //     child: Icon(Icons.receipt_rounded),
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => RecordView()),
        //       );
        //     },
        //   ),
        // ),
        body: _CupertinoHomeScaffold(
            currentTab: model.currentTab,
            onSelectTab: model.select,
            widgetBuilders: _TabItemHospData.widgetBuilders,
            navigatorKey: _TabItemHospData.navigatorKey),
      ),
    );
  }
}

class _CupertinoHomeScaffold extends StatelessWidget {
  final TabItemHosp currentTab;
  final Function onSelectTab;
  final Map<TabItemHosp, WidgetBuilder> widgetBuilders;
  final Map<TabItemHosp, GlobalKey<NavigatorState>> navigatorKey;

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
          _buildItem(TabItemHosp.profile),
          _buildItem(TabItemHosp.search),
          _buildItem(TabItemHosp.request),
        ],
        onTap: (index) =>
            onSelectTab(TabItemHosp.values[index], navigatorKey[index]),
      ),
      tabBuilder: (BuildContext context, int index) {
        final item = TabItemHosp.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKey[item],
          builder: (context) => widgetBuilders[item](context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItemHosp tabItemHosp) {
    final itemData = _TabItemHospData.allData[tabItemHosp];
    final color = currentTab == tabItemHosp ? Colors.green : Colors.grey;

    return BottomNavigationBarItem(
      icon: Icon(
        itemData.icon,
        color: color,
      ),
    );
  }
}

class _TabItemHospData {
  const _TabItemHospData({@required this.title, @required this.icon});

  final String title;
  final IconData icon;

  static const Map<TabItemHosp, _TabItemHospData> allData = {
    TabItemHosp.profile: _TabItemHospData(
      title: 'Profile',
      icon: MdiIcons.accountOutline,
    ),
    TabItemHosp.search: _TabItemHospData(
      title: 'Search',
      icon: Icons.search,
    ),
    TabItemHosp.request: _TabItemHospData(
      title: 'Request',
      icon: MdiIcons.viewListOutline,
    ),
  };

  static Map<TabItemHosp, GlobalKey<NavigatorState>> get navigatorKey {
    return {
      TabItemHosp.profile: HospProfileView.navigatorKey,
      TabItemHosp.search: HospSearchView.navigatorKey,
      TabItemHosp.request: HospRequestView.navigatorKey,
    };
  }

  static Map<TabItemHosp, WidgetBuilder> get widgetBuilders {
    return {
      TabItemHosp.profile: (_) => HospProfileView(),
      TabItemHosp.search: (_) => HospSearchView(),
      TabItemHosp.request: (_) => HospRequestView(),
    };
  }
}
