import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/clohtes_model.dart';
import 'package:flutter_app/data/models/dummy_data.dart';
import 'package:flutter_app/screens/add_new_clothe_screen.dart';
import 'package:flutter_app/screens/clothe_details_screen.dart';
import 'package:flutter_app/screens/edit_clothes_screen.dart';
import 'package:flutter_app/widgets/main_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Clothes> clothesLIst = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (ctx, index){
        var clothes = clothesLIst[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(
            context, ClotheDetailsScreen.routeName,
            arguments: clothes,),
          onLongPress: () {
            Navigator.pushNamed(context, EditClotheScreen.routeName, arguments: {
              "clothes": clothes, "index": index
            },).then((_) => {setState((){

            }),});
          },
          child: MainListItem(
            imageUrl: clothes.imageUrl,
            name: clothes.name,
            price: clothes.price.toString(),
          ),
        );
      },
        itemCount: clothesLIst.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AddNewClotheScreen.routeName).then((value) {
          setState(() {});
        }),
        child: Icon(Icons.add),
      ),

    );
  }
}
