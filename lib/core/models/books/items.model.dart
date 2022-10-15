import 'package:books/core/models/books/access-info.model.dart';
import 'package:books/core/models/books/sale-info.model.dart';
import 'package:books/core/models/books/search-info.model.dart';
import 'package:books/core/models/books/volume-info.model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'items.model.g.dart';

@JsonSerializable()
class Items {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final VolumeInfo? volumeInfo;
  final SaleInfo? saleInfo;
  final AccessInfo? accessInfo;
  final SearchInfo? searchInfo;

  Items({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
