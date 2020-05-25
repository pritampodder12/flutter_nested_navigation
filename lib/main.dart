import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_tab_screen.dart';
import './providers/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeTabProvider>(
      create: (context) => HomeTabProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeTabScreen(),
      ),
    );
  }
}
