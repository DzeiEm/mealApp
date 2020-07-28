import 'package:flutter/material.dart';
import 'package:meal_app/data/category_data.dart';
import 'package:meal_app/widgets/category_item.dart';
import 'package:meal_app/model/meal.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 6,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 3),
      children: CATEGORY_DATA
          .map(
            (categoryData) => CategoryItem(
                categoryData.id, categoryData.title, categoryData.color),
          )
          .toList(),
    );
  }
}
