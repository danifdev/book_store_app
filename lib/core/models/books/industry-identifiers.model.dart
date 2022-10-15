import 'package:json_annotation/json_annotation.dart';
part 'industry-identifiers.model.g.dart';

@JsonSerializable()
class IndustryIdentifiers {
  final String? type;
  final String? identifier;

  IndustryIdentifiers({
    this.type,
    this.identifier,
  });

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);

  Map<String, dynamic> toJson() => _$IndustryIdentifiersToJson(this);
}
