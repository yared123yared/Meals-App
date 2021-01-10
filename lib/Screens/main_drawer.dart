

import 'package:flutter/material.dart';

import 'filters_screen.dart';

class MainDraweer extends StatelessWidget {
  Widget getListTile(String text, Icon icon, Function tapHandler){
    return ListTile(
      onTap: tapHandler,
      leading:icon,
      title: Text('$text',style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up !' , style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),),

          ),
          SizedBox(height:20,),
          getListTile('Meals',Icon(Icons.restaurant,size: 26,),(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          getListTile('Filter',Icon(Icons.filter_sharp,size: 26),(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),

        ],
      ),
    );
  }
}
