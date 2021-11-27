// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionSummary _$SectionSummaryFromJson(Map<String, dynamic> json) {
  return SectionSummary(
    notAvailableCount: json['n\/a'] as int?,
    failCount: json['fail'] as int?,
    passCount: json['pass'] as int?,
  );
}

Map<String, dynamic> _$SectionSummaryToJson(SectionSummary instance) =>
    <String, dynamic>{
      'n\/a': instance.notAvailableCount,
      'fail': instance.failCount,
      'pass': instance.passCount,
    };
