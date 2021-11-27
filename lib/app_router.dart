import 'package:car_inspect/presentation/bindings/car_inspect_binding.dart';
import 'package:car_inspect/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/views/inspect_screen.dart';

class AppRouter {
  static const String HOME = '/home';
  static const String INSPECT = '/inspect';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case INSPECT:
        return MaterialPageRoute(builder: (_) => InspectScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Not found route ${settings.name}'),
            ),
          ),
        );
    }
  }

  static final pages = [
    GetPage(
      name: HOME,
      page: () => HomeScreen(),
      binding: CarInspectBinding(),
    ),
    GetPage(
      name: INSPECT,
      page: () => InspectScreen(),
    ),
  ];
}
