

import 'package:flutter/material.dart';
import 'file:///C:/Users/yared/AndroidStudioProjects/flutter_app4/shopping_app/lib/Widget/category_item.dart';

import '../dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id ,catData.title, catData.color)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,



    ) ,) ;
  }
}
