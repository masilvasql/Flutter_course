import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
      ),
      body: Center(
        child: Text('Receitas por categoria ${category.id}',
            style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
