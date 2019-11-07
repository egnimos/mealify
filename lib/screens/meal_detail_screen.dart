import 'package:flutter/material.dart';
import '../dummy_dart.dart';


class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function isToggleFavorite;
  final Function isFavorite;

  //construct
  MealDetailScreen(this.isToggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {

    return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: Theme.of(context).textTheme.title,
            ),
          );
  }

  Widget buildContainer(Widget child) {

    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 300,
            width: 300,
            child: child,
    );
  }


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
              child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
              ),
          ),

          //custom Widget
          buildSectionTitle(context, 'Ingredients'),
          
          //custom Widget
          buildContainer( ListView.builder(
              itemBuilder: (ctx, index) => Card(
                elevation: 4,
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(selectedMeal.ingredients[index]),
                  ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),//buildContainer

          buildSectionTitle(context, 'Steps'),//buildSectionTitle
          buildContainer( ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
              ListTile(
                leading: CircleAvatar(child: Text('# ${index + 1}'),),
                title: Text(
                  selectedMeal.steps[index]
                ),
              ),
              Divider(),
              ],),
              itemCount: selectedMeal.steps.length,
            ),
          ),//buildContainer

        ],),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          isToggleFavorite(mealId);
        },
      ),
    );
  }
}