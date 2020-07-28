import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

// stfull widget'as naudojamas, nes mum reikia zinoti ar jau panaudotas kazkoks filtras.

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';
  final Function saveFilters;
  final Map<String, bool> currectFilters;

  FiltersScreen(this.currectFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() { 
    _glutenFree = widget.currectFilters['gluten'];
    _vegetarian = widget.currectFilters['vegetarian'];
    _vegan  = widget.currectFilters['vegan'];
    _lactoseFree = widget.currectFilters['lactose'];
    super.initState();
    
  }

// pareina is main.screen'o kur i navigation'a idedu sita funkcija

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      //  pridedam value kur nurodom state'a - kokia situacija
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final myselectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(myselectedFilters);
              }),
        ],
      ),
      // uzmetam drawer'i tam, kad nebutu navigation'o i burgerio turini
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust you meal selection'),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile('Gluten free',
                    'Includes only gluten free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Nothing included', _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                buildSwitchListTile('Fully vegan', 'Vegan food', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose free', 'Lactose no any lactose', _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
