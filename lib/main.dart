import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_meal_screen.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.pinkAccent,
        canvasColor: Color.fromRGBO(255, 254, 220, 1),
      ),
      home: TabsScreen(),
      routes: {
        // '/': (context) => CategoriesMealScreen(),
        CategoriesMealScreen.routname: (context) => CategoriesMealScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
        FavouritesScreen.routeName: (context) => FavouritesScreen(),
      },
      // naudojamas kaip apsauga, jei netycia user'iu nenaviguotu kur turetu... 
      // pries nuluztant user'i nusius i kazkoki default page'a
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}