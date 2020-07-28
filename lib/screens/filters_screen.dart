import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Your Filters'),
      ),
      // uzmetam drawer'i tam, kad nebutu navigation'o i burgerio turini
      drawer: MainDrawer(),
      body: Center(
        child: Text('body text'),
      ),
    );
  }
}
