import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../providers/index.dart';
import '../routes/index.dart';
import '../constants/index.dart';

class HomeTabScreen extends StatefulWidget {
  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  int previousTabIndex = 1;
  @override
  void initState() {
    super.initState();

    tabController = TabController(initialIndex: 1, length: 3, vsync: this);

    tabController.addListener(handleTabChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeTabProvider>(context, listen: false)
          .setTabController(tabController);
    });
  }

  handleTabChange() {
    if (tabController.indexIsChanging) {
      setState(() {
        previousTabIndex = tabController.previousIndex;
      });
    }
  }

  GlobalKey<NavigatorState> currentNavigatorKey() {
    switch (tabController.index) {
      case 0:
        return Provider.of<HomeTabProvider>(context, listen: false)
            .contactUsNavKey;
        break;
      case 1:
        return Provider.of<HomeTabProvider>(context, listen: false).scanNavKey;
        break;
      case 2:
        return Provider.of<HomeTabProvider>(context, listen: false).newsNavKey;
        break;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabController.index != 1) {
          currentNavigatorKey().currentState.popUntil((route) {
            if (!route.isFirst)
              currentNavigatorKey().currentState.maybePop();
            else
              tabController.animateTo(1);
            return true;
          });
        } else
          return !await currentNavigatorKey().currentState.maybePop();
        return null;
      },
      child: Scaffold(
        bottomNavigationBar: new Container(
          color: Colors.white10,
          height: 70,
          child: Material(
            color: Colors.transparent,
            child: TabBar(
              unselectedLabelColor: ColorNames.primaryColor,
              labelColor: ColorNames.primaryColor,
              labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
              controller: tabController,
              indicator: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 8, color: ColorNames.secondaryColor))),
              onTap: (index) {
                if (previousTabIndex == index)
                  currentNavigatorKey()
                      .currentState
                      .popUntil((route) => route.isFirst
                          //return true;
                          );
                else
                  setState(() {
                    previousTabIndex = index;
                  });
              },
              tabs: [
                Tab(
                  icon: SvgPicture.asset(
                    ImageNames.tabContact,
                    color: ColorNames.primaryColor,
                    height: 25,
                    width: 25,
                  ),
                  text: 'CONTACT US',
                ),
                Tab(
                  icon: SvgPicture.asset(
                    ImageNames.tabScan,
                    color: ColorNames.primaryColor,
                    height: 25,
                    width: 25,
                  ),
                  text: 'SCAN',
                ),
                Tab(
                  icon: SvgPicture.asset(
                    ImageNames.tabNews,
                    color: ColorNames.primaryColor,
                    height: 25,
                    width: 25,
                  ),
                  text: 'NEWS',
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Navigator(
                  key: Provider.of<HomeTabProvider>(context).contactUsNavKey,
                  initialRoute: 'contact_us',
                  onGenerateRoute: homeTabRoute),
              Navigator(
                  key: Provider.of<HomeTabProvider>(context).scanNavKey,
                  initialRoute: 'scan',
                  onGenerateRoute: homeTabRoute),
              Navigator(
                  key: Provider.of<HomeTabProvider>(context).newsNavKey,
                  initialRoute: 'news',
                  onGenerateRoute: homeTabRoute),
            ]),
      ),
    );
  }
}
