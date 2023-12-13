import 'package:flutter/material.dart';
import 'package:login_page/utils/routes.dart';
import 'package:login_page/utils/routes_name.dart';

void main() {
  runApp(
    const MaterialApp(
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    ),
  );
}
