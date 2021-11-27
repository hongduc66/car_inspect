import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_inspect/domain/entities/category.dart';
import 'package:car_inspect/domain/entities/section_item.dart';
import 'package:car_inspect/presentation/controllers/car_inspect_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailTile extends StatelessWidget {
  final Category category;
  final CarInspectController _inspectController = Get.find();
  CategoryDetailTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent.withOpacity(0.5),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildItemInfoList(),
      ),
    );
  }

  Widget _buildTitleLabel() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.3)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              category.categoryLabel!,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                category.categorySummary!.notAvailableCount != 0
                    ? Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            category.categorySummary!.notAvailableCount
                                .toString(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(width: 4.0),
                category.categorySummary!.failCount != 0
                    ? Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            category.categorySummary!.failCount.toString(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(width: 4.0),
                category.categorySummary!.passCount != 0
                    ? Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            category.categorySummary!.passCount.toString(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildItemInfoList() {
    List<Widget> itemInfo = [];

    /// Add Title Label
    itemInfo.add(_buildTitleLabel());

    /// For each item in Category, add a widget contains info depends on its type
    category.listSectionItems!.forEach((sectionItem) async {
      switch (sectionItem.type) {
        case ItemType.PHOTO_TILE:
          if (sectionItem.value != null) {
            String? url = _inspectController.inspectInfo!.listInspectImages!
                .firstWhere((image) => image.id.toString() == sectionItem.value)
                .cdnUrl;
            itemInfo.addAll(
              [
                Container(
                  margin: const EdgeInsets.only(bottom: 2.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.blueAccent),
                    ),
                  ),
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: url!,
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Text(
                      sectionItem.label!,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          break;
        case ItemType.TEXT:
          if (sectionItem.value != null) {
            itemInfo.add(
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.blueAccent),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        sectionItem.label!,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        sectionItem.value!,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          break;
        case ItemType.RADIO:
          if (sectionItem.value != null) {
            itemInfo.add(
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.5, color: Colors.blueAccent),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        sectionItem.label!,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        sectionItem.value!,
                        style: TextStyle(
                          color: sectionItem.value! == 'pass'
                              ? Colors.green
                              : null,
                          fontWeight: sectionItem.value! == 'pass'
                              ? FontWeight.bold
                              : null,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          break;
        default:
          break;
      }
    });

    return itemInfo;
  }
}
