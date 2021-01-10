import 'package:flutter/material.dart';

import 'Models/meal.dart';
import 'Screens/category_meals_screen.dart';
import 'Screens/category_screen.dart';
import 'Screens/filters_screen.dart';
import 'Screens/meal_detail_screen.dart';
import 'Screens/tabs_screen.dart';
import 'dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegeterin':false,
  };
  List <Meal> _available_Meals=DUMMY_MEALS;
  List <Meal> _favoritMeals=[];

  void _toggleFormat(String mealId){
    final existingIndex=_favoritMeals.indexWhere((meal) => meal.id==mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoritMeals.removeAt(existingIndex);
      });
    }else{
      setState((){
        _favoritMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoritMeals.any((meal)=>meal.id==id);
  }

  void _setFilters(Map<String,bool> filterData){
    setState(() {
      _filters=filterData;
      _available_Meals=DUMMY_MEALS.where((meal){
          if(_filters['gluten'] && !meal.isGlutenFree){
            return false;
          }
          if(_filters['lactose'] && !meal.isLactoseFree){
            return false;
          }
          if(_filters['vegan'] && !meal.isVegan){
            return false;
          }
          if(_filters['vegeterin'] && !meal.isVegetarian){
            return false;
          }
          return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 31, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed'
          )

        )
      ),

      initialRoute:'/',
      routes: {
        '/' : (ctx)=>TabsScreen(_favoritMeals),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_available_Meals),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(this._toggleFormat, this._isMealFavorite),
        FiltersScreen.routeName : (ctx) => FiltersScreen(_filters,_setFilters),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>CategoryScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );

  }
}
