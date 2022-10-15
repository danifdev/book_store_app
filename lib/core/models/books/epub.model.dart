import 'package:json_annotation/json_annotation.dart';
part 'epub.model.g.dart';

@JsonSerializable()
class Epub {
  final bool? isAvailable;

  Epub({this.isAvailable});
  factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  Map<String, dynamic> toJson() => _$EpubToJson(this);
}
