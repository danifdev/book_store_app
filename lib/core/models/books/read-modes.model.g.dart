// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read-modes.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadingModes _$ReadingModesFromJson(Map<String, dynamic> json) => ReadingModes(
      text: json['text'] as bool?,
      image: json['image'] as bool?,
    );

Map<String, dynamic> _$ReadingModesToJson(ReadingModes instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };
