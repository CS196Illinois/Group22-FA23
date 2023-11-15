import 'package:flutter/material.dart';
import 'database.dart';

String recipeName = friedRice.recipeName;
String description = friedRice.description;
List ingredients = friedRice.ingredients;
String ingredientsString = "";
List instructions = friedRice.instructions;
String instructionsString = "";


class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  // This widget is the root of your application.
  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override

  Widget build(BuildContext context) {
    for (int i = 0; i < ingredients.length; i++) {
      ingredientsString += "• ${ingredients[i]} \n";
    }
    for (int i = 0; i < instructions.length; i++) {
      instructionsString += "${i + 1}. ${instructions[i]} \n";
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: Text(recipeName),
          backgroundColor: Colors.green[200],
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.logout))
          ]
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Description Header ----------------
            Container(
              //height: 50,
              decoration: BoxDecoration(
                color: Colors.green[300],
                //borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                "Description", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Description ----------------
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                //borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                description, 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Ingredients Header ----------------
            Container(
              //height: 50,
              decoration: BoxDecoration(
                color: Colors.green[300],
                //borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                "Ingredients", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Ingredients ----------------
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                //borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                ingredientsString, 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Instructions Header ----------------
            Container(
              //height: 50,
              decoration: BoxDecoration(
                color: Colors.green[300],
                //borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                "Instructions", 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Instructions ----------------
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100],
                //borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                instructionsString, 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      )
    );
  }  
} 