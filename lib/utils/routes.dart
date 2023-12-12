import 'package:flutter/material.dart';
import 'package:login_page/forth_page.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/linear_progress.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/second_page.dart';
import 'package:login_page/tabbar.dart';
import 'package:login_page/third_page.dart';
import 'package:login_page/utils/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RoutesName.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.secondPage:
        return MaterialPageRoute(builder: (context) => const SecondPage());
      case RoutesName.thirdPage:
        return MaterialPageRoute(builder: (context) => const ThirdPage());
      case RoutesName.forthPage:
        return MaterialPageRoute(builder: (context) => const ForthPage());
      case RoutesName.linearProgress:
        return MaterialPageRoute(
            builder: (context) => const LinearProgressIndicatorApp());
      case RoutesName.tabber:
        return MaterialPageRoute(builder: (context) => const Tabber());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
