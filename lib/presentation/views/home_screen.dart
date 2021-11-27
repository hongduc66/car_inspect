import 'package:car_inspect/app_router.dart';
import 'package:car_inspect/presentation/controllers/car_inspect_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarInspectController inspectController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Car Inspect App',
          style: Get.textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            await inspectController.getInspectInfo();
            if (inspectController.inspectInfo!.listCategories!.length != 0) {
              Get.toNamed(AppRouter.INSPECT);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Inspect',
              style: Get.textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}
