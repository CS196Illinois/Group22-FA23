import 'package:flutter/material.dart';
import 'package:foodrecipe/color.dart';
import 'package:foodrecipe/utiles/customsearchdelegate.dart';
import 'package:foodrecipe/utiles/databaseForIngredients.dart';
import 'package:foodrecipe/utiles/dialogbox.dart';
import 'package:foodrecipe/utiles/ingredienttile.dart';
import 'package:hive/hive.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  final _controller = TextEditingController();

  // reference Hive box
  final _box = Hive.box('ingredientBox');
  IngredientDataBase database = IngredientDataBase();

  @override
  void initState() {

    //if this is 1st time opening app, then create default data
    if (_box.get("INGREDIENTLIST") == null) {
      database.createInitialData();
    } else {
      //app has been opened before
      database.loadData();
    }

    super.initState();
  }

  //When called, opens dialog box that gives user ability to input ingredient
  //When the "Save" button is pressed (onSave), runs saveIngredient function
  //When the "Cancel" button is pressed (onCancel), closes the dialog window
  void addNewIngredient() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveIngredient,
          onCancel: onCancel,
        );
      },
    );
  }

  //on cancel button press, closes dialog box and resets text controller
  void onCancel() {
    setState(() {
      Navigator.of(context).pop();
    });
    _controller.text = "";
  }

  //removes ingredient from ingredientList
  void deleteIngredient(int index) {
    setState(() {
      database.ingredientList.removeAt(index);
      if (database.ingredientList.isEmpty) {
        database.ingredientList.add("Add An Ingredient!");
      }
    });
    database.updateDataBase();
  }

  //saves ingredient to ingredientList
  //closes dialog box
  //_controller.text is reset so the text input box is empty
  void saveIngredient() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        if (_controller.text.trim().isNotEmpty) {
          database.ingredientList.add(_controller.text.toLowerCase());
        }
      }
      _controller.text = "";
      if (database.ingredientList[0] == "Add An Ingredient!") {
        deleteIngredient(0);
      }
    });
    Navigator.of(context).pop();
    database.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            actions: [
              IconButton(onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate(database.ingredientList));
              }, icon: Icon(Icons.search))
            ],
            bottom: TabBar(tabs: [
              Tab(child: Text("Ingredients Available")),
            ]),
            title: Text("My Fridge"),
          ),
          body: TabBarView(children: [
            //Ingredients Page
            Scaffold(
              //add button, calls addNewIngredient function above
              floatingActionButton: FloatingActionButton(
                backgroundColor: primary,
                onPressed: addNewIngredient,
                child: Icon(Icons.add),
              ),
              //creates a scrollable list of tiles with ingredients in ingredientList
              body: ListView.builder(
                itemCount: database.ingredientList.length,
                itemBuilder: (context, index) {
                  return IngredientTile(
                    ingredientName: database.ingredientList[index],
                    deleteFunction: (p0) => deleteIngredient(index),
                  );
                },
              ),
            ),
          ])),
    );
  }
}
