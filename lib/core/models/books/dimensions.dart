import 'package:json_annotation/json_annotation.dart';
part 'dimensions.g.dart';

@JsonSerializable()
class Dimensions {
  final String? height;
  final String? width;
  final String? thickness;

  Dimensions({this.height, this.width, this.thickness});
  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}
