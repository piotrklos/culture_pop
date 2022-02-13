import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/src/core/model/category.dart';
import 'package:quizapp/src/ui/page/category_info.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final ValueChanged<CategoryModel> onTap;

  const CategoryWidget({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(category);
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        constraints: const BoxConstraints(
          minHeight: 150,
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: category.color,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: CachedNetworkImageProvider(category.imageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          color: Colors.grey,
        ),
        child: Text(
          category.title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(blurRadius: 10, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
