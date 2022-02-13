import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quizapp/src/core/model/color_converter.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required String id,
    required String type,
    required String title,
    required String descritpion,
    required String imageUrl,
    @ColorConverter() required Color color,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
