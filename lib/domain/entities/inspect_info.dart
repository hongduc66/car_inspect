import 'package:car_inspect/domain/entities/category.dart';
import 'package:car_inspect/domain/entities/inspect_image.dart';
import 'package:json_annotation/json_annotation.dart';

import 'inspect_image.dart';
import 'category.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class InspectInfo {
  String? id;
  List<InspectImage>? listInspectImages;
  List<Category>? listCategories;

  InspectInfo({
    this.id,
    this.listCategories,
    this.listInspectImages,
  });
}
