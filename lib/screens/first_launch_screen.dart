import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/index.dart';

List<String> guideText = [
  'Find The Code',
  'Scan The Code',
  'Instantly check if your medications are from an authorized distributor'
];

class FirstLaunch extends StatefulWidget {
  @override
  State createState() => new FirstLaunchState();
}

class FirstLaunchState extends State<FirstLaunch> {
  SharedPreferences sharedPreferences;
  int currentIndex = 0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      if (sharedPreferences.getBool('firstLaunched') == true)
        Navigator.pushReplacementNamed(context, 'home_tab');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: ColorNames.primaryColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                Image.asset(
                  ImageNames.intro1,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                Image.asset(
                  ImageNames.intro2,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                Image.asset(
                  ImageNames.intro3,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                )
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                'Three Easy Steps to eZTracker',
                style: TextStyle(
                    fontSize: 10,
                    color: ColorNames.primaryColor,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 50),
              Text(guideText[currentIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      color: ColorNames.primaryColor,
                      fontWeight: FontWeight.w400)),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  circleBar(0),
                  circleBar(1),
                  circleBar(2),
                ],
              ),
              SizedBox(height: 10),
              FlatButton(
                child: Text('SKIP INTRO',
                    style: TextStyle(
                        fontSize: 8,
                        color: ColorNames.primaryColor,
                        fontWeight: FontWeight.w400)),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('home_tab');
                  sharedPreferences?.setBool('firstLaunched', true);
                },
              ),
              SizedBox(height: 5),
            ]),
          ],
        ),
      ),
    );
  }

  Widget circleBar(int no) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: currentIndex != no
                  ? ColorNames.primaryColor
                  : Colors.transparent),
          color:
              currentIndex == no ? ColorNames.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
    );
  }
}
