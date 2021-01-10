import 'package:flutter/material.dart';
import 'package:shopping_app/Models/meal.dart';
import '../Widget/meal_item.dart';
class FavoriteScreen extends StatelessWidget {

  final List<Meal> favoritMeals;

  FavoriteScreen(this.favoritMeals);

  @override
  Widget build(BuildContext context) {
    if(this.favoritMeals.isEmpty){
      return Center(
        child: Text("You have no favorite yet - start adding some!"),
      );
    }else{
      return   ListView.builder(itemBuilder:(c,index){
        return MealItem(id:favoritMeals[index].id , title: favoritMeals[index].title,
          imageUrl: favoritMeals[index].imageUrl,
          duration: favoritMeals[index].duration,
          affordability: favoritMeals[index].affordability,

          complexity: favoritMeals[index].complexity,);
      },itemCount: favoritMeals.length ,
      );
    }

  }
}
