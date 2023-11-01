//This set of code creates the "Save" and "Cancel" buttons on the dialog box.
//The "onPressed" variable defines what method the button should run when the button is clicked/pressed.

import 'package:flutter/material.dart';

class DialogBoxButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  DialogBoxButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed, color: Colors.white, child: Text(text));
  }
}
