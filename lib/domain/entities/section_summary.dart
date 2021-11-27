import 'package:json_annotation/json_annotation.dart';
part 'section_summary.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SectionSummary {
  int? notAvailableCount;
  int? failCount = 0;
  int? passCount = 0;

  SectionSummary({
    this.notAvailableCount,
    this.failCount,
    this.passCount,
  });

  factory SectionSummary.fromJson(Map<String, dynamic> json) =>
      _$SectionSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$SectionSummaryToJson(this);
}
