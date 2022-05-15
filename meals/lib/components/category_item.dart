import 'package:flutter/material.dart';
import '../models/category.dart';

class CategortItem extends StatelessWidget {
  final Category category;

  const CategortItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
    );
  }
}
