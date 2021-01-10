
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName='/meal-detail';

  final Function toggleFormat;
  final Function isFavorite;

  MealDetailScreen(this.toggleFormat, this.isFavorite);


  Widget buildSectionTitle(BuildContext context, String text){
    return  Container(

      margin: EdgeInsets.symmetric(
        vertical: 10,

      ),
      child: Text('${text}',
        style: Theme.of(context).textTheme.headline6,),
    );
  }
  Widget buildContainer( Widget child){
    return Container(
        height: 200,
        width:300,
        decoration: BoxDecoration(
          color:Colors.white,
          border:Border.all(
              color:Colors.grey
          ),
          borderRadius: BorderRadius.circular(10),


        ),
        child:child,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              height: 200,
              width: double.infinity,

              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),

            ),
//           ingredient
            buildSectionTitle(context,'Ingredients'),

            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(

                  padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
            ) ),

            buildSectionTitle(context,'Steps'),
        buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider()
                    ],
                  ),
                )
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          this.isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed : () => this.toggleFormat(mealId),
      ),
    );
  }
}
