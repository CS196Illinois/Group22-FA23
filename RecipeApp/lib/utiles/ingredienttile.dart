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
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
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
            ingredientName,
            style: TextStyle(
              color: Colors.white,
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
