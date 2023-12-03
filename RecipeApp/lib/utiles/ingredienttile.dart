//blue tile w/ each ingredient name from ingredientList on a new tile

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodrecipe/color.dart';

class IngredientTile extends StatelessWidget {
  final String ingredientName;
  Function(BuildContext)? deleteFunction;
  IngredientTile({
    super.key,
    required this.ingredientName,
    required this.deleteFunction,
  });
  

  @override
  Widget build(BuildContext context) {
    String ingredientNameCorrectCapitalization = "";
    List ingredientNameSplit = ingredientName.split(" ");
    if (ingredientName.length > 1) {
      for (int i = 0; i < ingredientNameSplit.length; i++) {
        if (i > 0) {
          if (ingredientNameSplit[i].isNotEmpty) {
            ingredientNameCorrectCapitalization = ingredientNameCorrectCapitalization 
            + " " + ingredientNameSplit[i].substring(0, 1).toUpperCase() + ingredientNameSplit[i].substring(1);
          }
        } else {
          if (ingredientNameSplit[i].isNotEmpty) {
            ingredientNameCorrectCapitalization = ingredientNameCorrectCapitalization 
              + ingredientNameSplit[i].substring(0, 1).toUpperCase() + ingredientNameSplit[i].substring(1);
          }
        }
        
      }
    } else if (ingredientName.length == 1) {
      ingredientNameCorrectCapitalization = ingredientName.toUpperCase();
    } else {
      ingredientNameCorrectCapitalization = "";
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      //allows tile to be slidable, allows for delete button to remove ingredient from the list
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(40),
          alignment: Alignment.center,
  
          child: Text(
            ingredientNameCorrectCapitalization,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
