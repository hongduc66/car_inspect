// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionItem _$SectionItemFromJson(Map<String, dynamic> json) {
  return SectionItem()
    ..id = json['id'] as int?
    ..label = json['label'] as String?
    ..type = json['type'] as String?
    ..value = json['value'] as String?
    ..allowNotes = json['allow_notes'] as bool?;
}

Map<String, dynamic> _$SectionItemToJson(SectionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      'value': instance.value,
      'allow_notes': instance.allowNotes,
    };
