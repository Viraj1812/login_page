import 'package:flutter/material.dart';
import 'package:login_page/card_ex.dart';
import 'package:login_page/forth_page.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/linear_progress.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/registration_form.dart';
import 'package:login_page/second_page.dart';
import 'package:login_page/slider.dart';
import 'package:login_page/splash_screen.dart';
import 'package:login_page/tabbar.dart';
import 'package:login_page/third_page.dart';
import 'package:login_page/utils/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case RoutesName.registrationPage:
        return MaterialPageRoute(
            builder: (context) => const RegistrationForm());
      case RoutesName.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case RoutesName.secondPage:
        return MaterialPageRoute(
          builder: (context) => SecondPage(
            data: settings.arguments as Map,
          ),
        );
      case RoutesName.thirdPage:
        return MaterialPageRoute(builder: (context) => const ThirdPage());
      case RoutesName.forthPage:
        return MaterialPageRoute(builder: (context) => const ForthPage());
      case RoutesName.linearProgress:
        return MaterialPageRoute(
            builder: (context) => const LinearProgressIndicatorApp());
      case RoutesName.tabber:
        return MaterialPageRoute(builder: (context) => const Tabber());
      case RoutesName.slider:
        return MaterialPageRoute(builder: (context) => const SliderScreen());
      case RoutesName.card:
        return MaterialPageRoute(builder: (context) => const CardEx());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
