import 'package:flutter/material.dart';

import '../tabs/index.dart';
import '../pages/index.dart';

Route<dynamic> homeTabRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'contact_us':
      return MaterialPageRoute(builder: (context) => ContactUsTab());
      break;
    case 'scan':
      return MaterialPageRoute(builder: (context) => ScanTab());
      break;
    case 'news':
      return MaterialPageRoute(builder: (context) => NewsTab());
      break;
    case 'settings':
      return MaterialPageRoute(builder: (context) => SettingsPage());
      break;
    case 'login':
      return MaterialPageRoute(builder: (context) => LoginPage());
      break;
    case 'test_page':
      return MaterialPageRoute(builder: (context) => TestPage());
      break;

    default:
      return null;
      break;
  }
}
