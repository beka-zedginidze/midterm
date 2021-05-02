import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/clohtes_model.dart';

class ClotheDetailsScreen extends StatelessWidget {

  static const routeName = "/details-screen";

  @override
  Widget build(BuildContext context) {
    final Clothes clothes = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.network(clothes.imageUrl, height: 300),
              Text(clothes.name),
              Text(clothes.price.toString()),
              Text(clothes.size),
              Text(clothes.description),
            ],
          ),
        ),
      ),
    );
  }
}
