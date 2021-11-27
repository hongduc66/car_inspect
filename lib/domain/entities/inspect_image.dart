import 'package:json_annotation/json_annotation.dart';
part 'inspect_image.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class InspectImage {
  int? id;
  String? cdnUrl;

  InspectImage({
    this.id,
    this.cdnUrl,
  });

  factory InspectImage.fromJson(Map<String, dynamic> json) =>
      _$InspectImageFromJson(json);
  Map<String, dynamic> toJson() => _$InspectImageToJson(this);
}
