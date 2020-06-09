import 'package:flutter/material.dart';

import '../Types/TabControllerForSequencedAnimations.dart';

class HomeTabProvider extends ChangeNotifier {
  GlobalKey<NavigatorState> contactUsNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> scanNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> newsNavKey = GlobalKey<NavigatorState>();

  TabControllerForSequencedAnimations tabController;

  void setTabController(TabController controller) {
    tabController = controller;
    notifyListeners();
  }

  void changeToScanTabAndNavigate(String routeName) async {
    await tabController.animateTo(1);
    scanNavKey.currentState.pushNamed(routeName);
  }
}
