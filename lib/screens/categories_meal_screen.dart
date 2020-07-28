import 'package:flutter/material.dart';
import 'package:meal_app/data/meal_data.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:meal_app/model/meal.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routname = '/category-meals';
  final List<Meal> availableMeals;
  CategoriesMealScreen(this.availableMeals);

  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

// tas removeMeal daro remove tik tam kartui..
// todel didChangedDependencies atlieka tokia funkcija, jog istrina kol esi meal_detailed_screen page'e
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      // TODO: palauks kol uzkraus pilnai
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

//  TODO: KAIP cia taip pasiima??
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            idIteam: displayedMeals[index].id,
            title: displayedMeals[index].title,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
