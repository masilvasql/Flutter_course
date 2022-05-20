import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: "Raleway",
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    );
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Colors.amber,
          primary: Colors.pink,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            color: Colors.brown,
          ),
        ),
      ),
      home: CategoriesScreen(),
    );
  }
}
