import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName='/category-meals';


//  CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(itemBuilder:(c,index){

        }
        ),
      ),
    );
  }
}
