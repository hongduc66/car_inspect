import 'package:json_annotation/json_annotation.dart';
part 'section_item.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SectionItem {
  int? id;
  String? label;
  String? type;
  String? value;
  bool? allowNotes;

  SectionItem({
    this.id,
    this.label,
    this.type,
    this.value,
    this.allowNotes,
  });

  factory SectionItem.fromJson(Map<String, dynamic> json) =>
      _$SectionItemFromJson(json);
  Map<String, dynamic> toJson() => _$SectionItemToJson(this);
}

class ItemType {
  static const String PHOTO_TILE = "photo_tile";
  static const String PHOTO = "photos";
  static const String TEXT = "text";
  static const String RADIO = "radio";
}
