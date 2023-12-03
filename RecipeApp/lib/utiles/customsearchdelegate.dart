import 'package:flutter/material.dart';
import 'package:foodrecipe/utiles/databaseForIngredients.dart';
import 'package:hive/hive.dart';

class CustomSearchDelegate extends SearchDelegate {
  final _box = Hive.box('ingredientBox');
  IngredientDataBase database = IngredientDataBase();
  List ingredientList = [];

  CustomSearchDelegate(List setIngredientList) {
    ingredientList = setIngredientList;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () {
        query = '';
      }, icon: Icon(Icons.clear))
    ];
  }
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for (var ingredient in ingredientList) {
      if (ingredient.contains(query.toLowerCase())) {
        String ingredientCapitalLetter = ingredient.substring(0, 1).toUpperCase() + ingredient.substring(1);
        matchQuery.add(ingredientCapitalLetter);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for (var ingredient in ingredientList) {
      if (ingredient.contains(query.toLowerCase())) {
        String ingredientCapitalLetter = ingredient.substring(0, 1).toUpperCase() + ingredient.substring(1);
        matchQuery.add(ingredientCapitalLetter);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

}