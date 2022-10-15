import 'package:json_annotation/json_annotation.dart';
part 'panel-summary.model.g.dart';

@JsonSerializable()
class PanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);
}
