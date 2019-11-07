import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters-screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  //constructor
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue,) {

    return SwitchListTile(
                  title: Text(title),
                  value: currentValue,
                  subtitle: Text(description),
                  onChanged: updateValue,
                );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };

            widget.saveFilters(selectedFilters);
          },),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection',
            style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[

                //custom widget
                _buildSwitchListTile(
                  'Glutten-Free', 
                  'Only include Glutten-Free meals', 
                  _glutenFree, 
                  (newValue) {
                    setState(() {
            
                      _glutenFree = newValue;
                   
                    });
                  }
                  ),//buildSwitchListTile....

                _buildSwitchListTile(
                  'Lactose-Free', 
                  'Only include Lactose-Free meals', 
                  _lactoseFree, 
                  (newValue) {
                    setState(() {
            
                      _lactoseFree = newValue;
                   
                    });
                  }
                  ),//buildSwitchListTile....

                _buildSwitchListTile(
                  'Vegegtarian', 
                  'Only include Vegetarian meals', 
                  _vegetarian, 
                  (newValue) {
                    setState(() {
            
                      _vegetarian = newValue;
                   
                    });
                  }
                  ),//buildSwitchListTile....

                  _buildSwitchListTile(
                  'Vegan', 
                  'Only include Vegan meals', 
                  _vegan, 
                  (newValue) {
                    setState(() {
            
                      _vegan = newValue;
                   
                    });
                  }
                  ),//buildSwitchListTile....
              ],
            )
          ),
      ],)
    );
  }
}