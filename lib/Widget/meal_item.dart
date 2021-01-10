
import 'package:flutter/material.dart';
import '../Models/meal.dart';
import '../Screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final  Function removeItem;


  MealItem({@required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.removeItem,
    @required this.affordability});

  void selectMeal(BuildContext context){
      Navigator.of(context).pushNamed(MealDetailScreen.routeName,
          arguments: this.id).then((mealId) => removeItem(mealId));

  }
  String get complexiyText{
    switch(this.complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
        break;

    }
  }

  String get affordabilityText{
    switch(this.affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'ChalPriceylenging';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
        break;

    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> this.selectMeal(context),
      child: Card(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
        elevation: 4,
          margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(children: [


            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular((15),),

              ),
              child: Image.network(this.imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover,),



            ),
              Positioned(
                bottom: 20,
              right: 10,

                child: Container(
                  width: 300,
                  color:Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 4,
                  horizontal: 20),
                  child: Text(this.title,style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                    softWrap: true,
                    overflow: TextOverflow.fade,


                  ),
                ),
              )
            ],),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('${this.duration} min ')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(this.complexiyText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text(this.affordabilityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
