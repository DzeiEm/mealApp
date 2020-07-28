import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';

import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routname = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

//  TODO: KAIP cia taip pasiima??
    final categoryMeal = MEAL_DATA.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryId),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              idIteam: categoryMeal[index].id,
              title: categoryMeal[index].title,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,
              imageUrl: categoryMeal[index].imageUrl,
              affordability: categoryMeal[index].affordability);
        },
        itemCount: categoryMeal.length,
      ),
     
    );
  }
}
