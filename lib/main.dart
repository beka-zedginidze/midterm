import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_new_clothe_screen.dart';
import 'package:flutter_app/screens/clothe_details_screen.dart';
import 'package:flutter_app/screens/edit_clothes_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes App',
      theme: ThemeData(
      ),
      home: HomeScreen(),
      routes: {
        ClotheDetailsScreen.routeName: (ctx) => ClotheDetailsScreen(),
        AddNewClotheScreen.routeName: (ctx) => AddNewClotheScreen(),
        EditClotheScreen.routeName: (ctx) => EditClotheScreen(),
      },
    );
  }
}