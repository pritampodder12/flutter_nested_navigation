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

  Future<TabController> changeTab() async {}

  void changeToScanTabAndNavigate(String routeName) {
    tabController.animateTo(1);
    notifyListeners();
    Timer(Duration(milliseconds: 300),
        () => scanNavKey.currentState.pushNamed(routeName));
  }
}
