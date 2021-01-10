import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='filters';
  final Function saveForms;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveForms);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree=false;
  bool _vegeterian=false;
  bool _vegan=false;
  bool _lactosFree=false;
  @override
  initState(){

    _glutenFree=widget.currentFilters['gluten'];
    _vegeterian=widget.currentFilters['vegeterin'];
    _vegan=widget.currentFilters['vegan'];
    _lactosFree=widget.currentFilters['lactose'];
  }



  Widget _buildSwitchListTile(String title, String description, bool currentValue,Function updateValue){
    return SwitchListTile(
      title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save),
              onPressed: (){
            final selectedFilters={
              'gluten':_glutenFree,
              'lactose':_lactosFree,
              'vegan':_vegan,
              'vegeterin':_vegeterian,
            };

            widget.saveForms(selectedFilters);
              }

          )
        ],
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
