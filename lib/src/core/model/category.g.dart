// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryModel _$$_CategoryModelFromJson(Map<String, dynamic> json) =>
    _$_CategoryModel(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      descritpion: json['descritpion'] as String,
      imageUrl: json['imageUrl'] as String,
      color: const ColorConverter().fromJson(json['color'] as String?),
    );

Map<String, dynamic> _$$_CategoryModelToJson(_$_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'descritpion': instance.descritpion,
      'imageUrl': instance.imageUrl,
      'color': const ColorConverter().toJson(instance.color),
    };
