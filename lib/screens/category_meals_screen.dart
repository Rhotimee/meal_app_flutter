import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            final cat = categoryMeals[index];
            return MealItem(
              id: cat.id,
              title: cat.title,
              imageUrl: cat.imageUrl,
              duration: cat.duration,
              complexity: cat.complexity,
              affordability: cat.affordability,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
