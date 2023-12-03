import 'package:hive/hive.dart';

class IngredientDataBase {
  List ingredientList = [];
  
  // reference box
  final _box = Hive.box('ingredientBox');

  //runs if this is the 1st time user opens app
  void createInitialData() {
    ingredientList = ["Add An Ingredient!"];
  }

  //load data from database
  void loadData() {
    ingredientList = _box.get("INGREDIENTLIST");
  }

  //update database
  void updateDataBase() {
    _box.put("INGREDIENTLIST", ingredientList);
    ingredientList.sort();
  }
}