import 'package:json_annotation/json_annotation.dart';
part 'pdf.model.g.dart';

@JsonSerializable()
class Pdf {
  final bool? isAvailable;
  final String? acsTokenLink;

  Pdf({
    this.isAvailable,
    this.acsTokenLink,
  });

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);

  Map<String, dynamic> toJson() => _$PdfToJson(this);
}
