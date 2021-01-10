import 'package:flutter/material.dart';

import 'category_screen.dart';
import 'favorites_screen.dart';
import 'filters_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('$getTitle'),

      ),
      drawer: Drawer(
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
              Navigator.of(context).pushNamed('/');
            }),
            getListTile('Filter',Icon(Icons.filter_sharp,size: 26),(){
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            }),

          ],
        ),
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
