import 'package:json_annotation/json_annotation.dart';
part 'search-info.model.g.dart';

@JsonSerializable()
class SearchInfo {
  final String? textSnippet;

  SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchInfoToJson(this);
}
