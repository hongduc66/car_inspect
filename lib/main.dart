import 'package:car_inspect/app_router.dart';
import 'package:car_inspect/app_theme.dart';
import 'package:car_inspect/presentation/bindings/car_inspect_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'presentation/views/home_screen.dart';

void main() => runApp(CarInspector());

class CarInspector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      getPages: AppRouter.pages,
      initialBinding: CarInspectBinding(),
      title: 'Car Inspector',
      theme: AppTheme.light,
      builder: (context, child) {
        return MediaQuery(
          child: child ?? Container(),
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
        );
      },
      home: Builder(
        builder: (context) {
          return HomeScreen();
        },
      ),
    );
  }
}
