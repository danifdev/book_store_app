import 'package:json_annotation/json_annotation.dart';
part 'sale-info.model.g.dart';

@JsonSerializable()
class SaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;

  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });
  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}
