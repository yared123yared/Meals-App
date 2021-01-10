import 'package:flutter/material.dart';

import 'category_screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages=[
    CategoryScreen(),
    FavoriteScreen()
  ];
  int _selectedPageIndex = 0 ;

  void _selectPage(int index) {
    this.setState(() {

      this._selectedPageIndex=index;
    });
  }
  String get getTitle{
    String value='';

    if(this._selectedPageIndex==0){
//      Category section
    value='Categories';
    }else{
      value='Favorities';
    }

    return value;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$getTitle'),

      ),
      body: _pages[this._selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor:Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPageIndex,
        onTap: this._selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
            backgroundColor: Theme.of(context).primaryColor
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorities'),
              backgroundColor: Theme.of(context).primaryColor
          )
        ],
      ),
    );
  }
}
