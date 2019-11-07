import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_dart.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map(
        (catData) => CategoryItem(
        catData.id,
        catData.title,
        catData.color,
      ),
      ).toList(),

      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
  
}