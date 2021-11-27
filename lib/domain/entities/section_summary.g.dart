// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionSummary _$SectionSummaryFromJson(Map<String, dynamic> json) {
  return SectionSummary(
    notAvailableCount: json['not_available_count'] as int?,
    failCount: json['fail_count'] as int?,
    passCount: json['pass_count'] as int?,
  );
}

Map<String, dynamic> _$SectionSummaryToJson(SectionSummary instance) =>
    <String, dynamic>{
      'not_available_count': instance.notAvailableCount,
      'fail_count': instance.failCount,
      'pass_count': instance.passCount,
    };
