import 'package:books/core/models/books/access-info.model.dart';
import 'package:books/core/models/books/sale-info.model.dart';
import 'package:books/core/models/books/volume-info.model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail.model.g.dart';

@JsonSerializable()
class DetailModel {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;

  DetailModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
  });
  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);
}
