import 'package:flutter/material.dart';
import 'package:flutter_app/data/models/clohtes_model.dart';
import 'package:flutter_app/data/models/repository/clothes_helper.dart';

class AddNewClotheScreen extends StatelessWidget {
  static const routeName = "/add-new-clothe";

  final _formKey = GlobalKey<FormState>();

  TextEditingController clothesId = TextEditingController();
  TextEditingController clothesName = TextEditingController();
  TextEditingController clothesUrl= TextEditingController();
  TextEditingController clothesSize = TextEditingController();
  TextEditingController clothesPrice = TextEditingController();
  TextEditingController clothesDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        ClothesRepository().addClothe(clothes);
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
