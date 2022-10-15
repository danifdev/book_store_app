import 'package:books/core/models/books/items.model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'books.g.dart';

@JsonSerializable()
class Books {
  final String? kind;
  final int? totalItems;
  final List<Items>? items;

  Books({
    this.kind,
    this.totalItems,
    this.items,
  });

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);

  Map<String, dynamic> toJson() => _$BooksToJson(this);
}















