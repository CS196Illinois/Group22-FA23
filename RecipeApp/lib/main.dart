import 'package:flutter/material.dart';
import 'package:foodrecipe/screens/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {

  //initialize hive database
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('ingredientBox');

  runApp( const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
  

    );
  }
}
