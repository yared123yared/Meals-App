import 'package:flutter/material.dart';

import '../Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  const CategoryItem(this.id,this.title,this.color);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
     CategoryMealsScreen.routeName,arguments: {
        'id':id,
      'title' : title,
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              this.color.withOpacity(0.7),
              color


            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
