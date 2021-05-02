import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/clohtes_model.dart';
import 'package:flutter_app/data/models/repository/clothes_helper.dart';

class EditClotheScreen extends StatefulWidget {
  static const routeName = "/edit-clothe-screen";
  @override
  _EditClotheScreenState createState() => _EditClotheScreenState();
}

class _EditClotheScreenState extends State<EditClotheScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController clothesId;
  TextEditingController clothesName;
  TextEditingController clothesUrl;
  TextEditingController clothesSize;
  TextEditingController clothesPrice;
  TextEditingController clothesDescription;
  @override
  Widget build(BuildContext context) {
    final Map parsedData = ModalRoute.of(context).settings.arguments;
    final Clothes clothes = parsedData["clothes"];
    final int index = parsedData["index"];
    clothesId = TextEditingController(text: clothes.id.toString());
    clothesName = TextEditingController(text: clothes.name);
    clothesUrl = TextEditingController(text: clothes.imageUrl);
    clothesSize = TextEditingController(text: clothes.size);
    clothesPrice = TextEditingController(text: clothes.price.toString());
    clothesDescription = TextEditingController(text: clothes.description);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left:15, right: 15, top: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    child: TextFormField(
                      controller: clothesId,
                      decoration: InputDecoration(hintText: "Please enter ID "),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "please enter valid ID";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: clothesName,
                      decoration: InputDecoration(hintText: "Please enter name"),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "please enter name";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: clothesUrl,
                      decoration: InputDecoration(hintText: "Please enter Url"),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "please enter valid Url";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: clothesSize,
                      decoration: InputDecoration(hintText: "Please enter Size"),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "please enter valid Size";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: clothesPrice,
                      decoration: InputDecoration(hintText: "Please enter Price"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "please enter valid price";
                        }
                        return null;
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      controller: clothesDescription,
                      decoration: InputDecoration(hintText: "Please enter Description"),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "please enter valid description";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Back"),
                      ),
                      ElevatedButton(onPressed: () {
                        if(_formKey.currentState.validate()) {
                          Clothes clothes = Clothes(
                            id: int.parse(clothesId.text),
                            name: clothesName.text,
                            imageUrl: clothesUrl.text,
                            size: clothesSize.text,
                            price: double.parse(clothesPrice.text),
                            description: clothesDescription.text,

                          );
                          ClothesRepository().editClothe(clothes,index);
                          Navigator.pop(context);

                        }}, child: Text("Add"))

                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );

  }
}
