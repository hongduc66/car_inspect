import 'dart:convert';

import 'package:car_inspect/domain/entities/category.dart';
import 'package:car_inspect/domain/entities/inspect_image.dart';
import 'package:car_inspect/domain/entities/inspect_info.dart';
import 'package:car_inspect/domain/entities/section_item.dart';
import 'package:car_inspect/domain/entities/section_summary.dart';
import 'package:car_inspect/domain/repositories/inspect_repository.dart';
import 'package:flutter/services.dart';

class InspectInfoRepositoryImpl implements InspectInfoRepository {
  @override
  Future<InspectInfo> getInspectInfomation() async {
    try {
      String src = await rootBundle.loadString('assets/mock_data.json');
      Map<String, dynamic> data = await jsonDecode(src)['data'];

      // get list categories
      List<dynamic> rawCategories = data['report'];
      List<Category> listCategories = [];
      rawCategories.forEach((e) {
        List<dynamic> rawSectionItems = e['items'];
        List<SectionItem> listSectionItems = [];
        rawSectionItems.forEach((e) {
          listSectionItems.add(SectionItem.fromJson(e));
        });
        SectionSummary sectionSummary =
            SectionSummary.fromJson(e['item_summary']);
        listCategories.add(
          Category(
            categoryLabel: e['category_label'],
            categorySummary: sectionSummary,
            listSectionItems: listSectionItems,
          ),
        );
      });

      // get list display images
      List<dynamic> rawInspectImages = data['inspection_item_images'];
      List<InspectImage> listInspectImages = [];
      rawInspectImages.forEach(
        (e) => listInspectImages.add(
          InspectImage(id: e['id'], cdnUrl: e['cdn_url']),
        ),
      );

      print('Load data done');
      return InspectInfo(
        id: data['id'].toString(),
        listCategories: listCategories,
        listInspectImages: listInspectImages,
      );
    } catch (error) {
      print('Load data failed with error: $error');
      return InspectInfo();
    }
  }
}
