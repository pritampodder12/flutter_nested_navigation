import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/index.dart';
import '../constants/index.dart';
import './change_language_alert.dart';

Widget mainAppBar(
        {BuildContext context,
        Widget leading,
        String title,
        List<Widget> actions}) =>
    PreferredSize(
        child: Container(
          color: ColorNames.primaryColor,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: 8,
              left: 4,
              right: 4),
          child: Stack(
            children: <Widget>[
              Positioned(
                  child:
                      leading == null ? Container() : userIconButton(context),
                  left: 0,
                  bottom: 0),
              Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      title == null ? Container() : appBarTitle(title: title)),
              Positioned(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions == null ? [] : actions,
                  ),
                  right: 0,
                  bottom: 0)
            ],
          ),
        ),
        preferredSize: Size(MediaQuery.of(context).size.width, 62));

Widget appBarTitle({String title}) => Text(
      title,
      style: TextStyle(
          fontSize: 18,
          color: ColorNames.white,
          fontWeight: FontWeight.w600,
          fontFamily: 'default'),
    );

Widget userIconButton(BuildContext context) => Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(10),
          width: 44,
          height: 40,
          child: Image.asset(
            ImageNames.userIcon,
            color: Colors.white,
          ),
        ),
        onTap: () {
          // SharedPreferences.getInstance().then((SharedPreferences sp) {
          //   if (Provider.of<HomeTabProvider>(context, listen: false)
          //           .tabController
          //           .index !=
          //       1)
          //     Provider.of<HomeTabProvider>(context, listen: false)
          //         .changeToScanTabAndNavigate(
          //             sp.getBool('loggedIn') ? 'test_page' : 'login');
          //   else
          //     Navigator.of(context).pushNamed('login');
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     sp.getBool('loggedIn') ? 'test_page' : 'login',
          //     (route) => route.isCurrent && route.settings.name == "login"
          //         ? false
          //         : true);
          if (Provider.of<HomeTabProvider>(context, listen: false)
                  .tabController
                  .index !=
              1)
            Provider.of<HomeTabProvider>(context, listen: false)
                .changeToScanTabAndNavigate('login');
          else
            Navigator.of(context).pushNamedAndRemoveUntil(
                "login",
                (route) => route.isCurrent && route.settings.name == "login"
                    ? false
                    : true);
        },
      ),
    );

Widget languageChangeIconButton(BuildContext context) => Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
            padding: EdgeInsets.all(10),
            width: 44,
            height: 40,
            child: Image.asset(
              ImageNames.globeIcon,
              color: Colors.white,
            )),
        onTap: () {
          showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) => ChangeLanguage());
        },
      ),
    );
