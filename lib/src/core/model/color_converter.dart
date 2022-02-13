import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter implements JsonConverter<Color, String?> {
  const ColorConverter();

  @override
  Color fromJson(dynamic json) {
    return Colors.white;
 }

  @override
   String? toJson(Color? data) => null;
}