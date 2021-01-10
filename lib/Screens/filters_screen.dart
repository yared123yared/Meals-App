import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree=false;
  bool _vegeterian=false;
  bool _vegan=false;
  bool _lactosFree=false;
  Widget _buildSwitchListTile(String title, String description, bool currentValue,Function updateValue){
    return SwitchListTile(
      title: Text(title),
        subtitle: Text(description),
        value: _glutenFree,
        onChanged: updateValue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDraweer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your Meal Selection',
            style: Theme.of(context).textTheme.headline6,),
          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchListTile('Gluteen-free',
                  'Only include gluteen-free meals',
              _glutenFree,(newValue){
                setState(() {
                  _glutenFree=newValue;
                });
                  }),
              _buildSwitchListTile('Lactose-free',
                  'Only include Lactose-free meals',
                  _lactosFree,(newValue){
                    setState(() {
                      _lactosFree=newValue;
                    });
                  }),
              _buildSwitchListTile('Vegeterian',
                  'Only include Vegeterian meals',
                  _vegeterian,(newValue){
                    setState(() {
                      _vegeterian=newValue;
                    });
                  }),
              _buildSwitchListTile('Vegan',
                  'Only include Vegan meals',
                  _vegan,(newValue){
                    setState(() {
                      _vegan=newValue;
                    });
                  }),


            ],
          ))
        ],
      ),

    );
  }
}
