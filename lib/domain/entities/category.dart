import 'package:json_annotation/json_annotation.dart';

import 'section_summary.dart';
import 'section_item.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Category {
  String? categoryLabel;
  List<SectionItem>? listSectionItems;
  SectionSummary? categorySummary;

  Category({
    this.categoryLabel,
    this.listSectionItems,
    this.categorySummary,
  });
}
