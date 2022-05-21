import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        textTheme: const TextTheme(
          titleLarge: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            color: Colors.brown,
          ),
          titleSmall: TextStyle(
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      // home: CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (ctx) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
      },
    );
  }
}
