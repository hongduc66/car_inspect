// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspect_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectImage _$InspectImageFromJson(Map<String, dynamic> json) {
  return InspectImage()
    ..id = json['id'] as int?
    ..cdnUrl = json['cdn_url'] as String?;
}

Map<String, dynamic> _$InspectImageToJson(InspectImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cdn_url': instance.cdnUrl,
    };
