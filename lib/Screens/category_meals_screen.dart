import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../dummy_data.dart';
import '../Widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName='/category-meals';
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData=false;
  @override
  void initState() {
    // TODO: implement initState



  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(! _loadedInitData){
      final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
      categoryTitle=routeArgs['title'];
      final categoryId=routeArgs['id'];
      displayedMeals=widget.availableMeal.where((meal){
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData=true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
//    funciton to remove the single meal from the meal array
  setState(() {

    displayedMeals.removeWhere((meal) => meal.id==mealId);
  });
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(itemBuilder:(c,index){
            return MealItem(id:displayedMeals[index].id , title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
            complexity: displayedMeals[index].complexity,);
        },itemCount: displayedMeals.length ,
        ),

      ),
    );
  }
}
