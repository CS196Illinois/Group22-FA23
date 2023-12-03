//code for the dialog box itself

import 'package:flutter/material.dart';
import 'package:foodrecipe/color.dart';
import 'package:foodrecipe/utiles/dialogboxbutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
            //Defines what the TextField input looks like (decoration section).
            //The controller stores the text that is input into the box.
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add an ingredient",
              ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Save Button
              DialogBoxButton(text: "Save", onPressed: onSave),
              //Spacing
              const SizedBox(width: 10),
              //Cancel Button
              DialogBoxButton(text: "Cancel", onPressed: onCancel),
            ],
          ),
        ]
        ),
      ),
    );
  }
}