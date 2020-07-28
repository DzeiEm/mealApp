import 'package:flutter/material.dart';
import 'package:meal_app/screens/favourites_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String textTitle, IconData icon, Function tapHandler) {
// kadangi text'as yra dynaminis, mum reikia paduoti ji i kabutes
    return ListTile(
      leading: Icon(icon),
      title: Text(
        textTitle,
        style: TextStyle(fontSize: 20),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Cooking up',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 26),
            ),
            decoration: BoxDecoration(color: Colors.pink),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.filter, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          buildListTile('Favourites', Icons.favorite, () {
            Navigator.of(context).pushReplacementNamed(FavouritesScreen.routeName);
          }),
        ],
      ),
    );
  }
}
