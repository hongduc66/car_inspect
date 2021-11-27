import 'package:car_inspect/presentation/controllers/car_inspect_controller.dart';
import 'package:car_inspect/presentation/views/widgets/category_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InspectScreen extends StatefulWidget {
  @override
  _InspectScreenState createState() => _InspectScreenState();
}

class _InspectScreenState extends State<InspectScreen>
    with SingleTickerProviderStateMixin {
  CarInspectController _inspectController = Get.find();
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: _inspectController.inspectInfo!.listCategories!.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Inspection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '#${_inspectController.inspectInfo!.id}',
              style: Get.textTheme.bodyText2!.copyWith(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
        // title: Text(
        //   'Inspection \n#${_inspectController.inspectInfo!.id}',
        //   style: Get.textTheme.headline1,
        // ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 36.0,
            child: TabBar(
              isScrollable: true,
              tabs: _buildTabs(),
              controller: _tabController,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: _inspectController.inspectInfo!.listCategories!.length,
              itemBuilder: (BuildContext context, int index) {
                return CategoryDetailTile(
                  category:
                      _inspectController.inspectInfo!.listCategories![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTabs() {
    List<Widget> tabList = [];
    _inspectController.inspectInfo!.listCategories!.forEach((category) {
      tabList.add(
        Text(
          category.categoryLabel!.toUpperCase(),
          style: TextStyle(
            letterSpacing: 0.5,
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
      );
    });
    return tabList;
  }
}
