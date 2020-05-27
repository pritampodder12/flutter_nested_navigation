import 'package:flutter/material.dart';
import 'dart:async';

class HomeTabProvider extends ChangeNotifier {
  GlobalKey<NavigatorState> contactUsNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> scanNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> newsNavKey = GlobalKey<NavigatorState>();

  TabController tabController;

  void setTabController(TabController controller) {
    tabController = controller;
    notifyListeners();
  }

  GlobalKey<NavigatorState> currentNavigatorKey() {
    switch (tabController.index) {
      case 0:
        return contactUsNavKey;
        break;
      case 1:
        return scanNavKey;
        break;
      case 2:
        return newsNavKey;
        break;
    }
    return null;
  }

  void changeToScanTabAndNavigate(String routeName) {
    tabController.animateTo(1);
    notifyListeners();
    Timer(Duration(milliseconds: 350),
        () => scanNavKey.currentState.pushNamed(routeName));
  }
}
