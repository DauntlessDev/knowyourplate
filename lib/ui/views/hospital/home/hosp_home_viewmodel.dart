import 'package:stacked/stacked.dart';

class HospHomeViewModel extends BaseViewModel {
  TabItemHosp _currentTab = TabItemHosp.profile;
  TabItemHosp get currentTab => _currentTab;

  void select(TabItemHosp value, navigatorKeyValue) {
    _currentTab = value;
    notifyListeners();
  }
}



enum TabItemHosp { profile, search, request }