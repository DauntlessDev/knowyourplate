import 'package:stacked/stacked.dart';

class UserHomeViewModel extends BaseViewModel {
  TabItem _currentTab = TabItem.profile;
  TabItem get currentTab => _currentTab;

  void select(TabItem value, navigatorKeyValue) {
    _currentTab = value;
    notifyListeners();
  }
}

enum TabItem { profile, stats, search }
