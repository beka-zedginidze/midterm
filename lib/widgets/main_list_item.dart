import 'package:flutter/material.dart';

class MainListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  MainListItem({
    this.imageUrl,
    this.name,
    this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: FadeInImage(
                height: 200,
                placeholder: AssetImage("assets/images/clothes_placeholder.png"),
                image: NetworkImage(imageUrl),
              ),
            ),
            Text(name),
            Text(price),
          ],
        ),
      ),
    );
  }
}
