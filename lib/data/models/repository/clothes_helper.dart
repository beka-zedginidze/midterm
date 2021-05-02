import 'package:flutter_app/data/models/clohtes_model.dart';
import 'package:flutter_app/data/models/dummy_data.dart';

class ClothesRepository {
  void addClothe (Clothes clothes) {
    DUMMY_DATA.add(clothes);
  }

  void removeClothe(int id) {
    DUMMY_DATA.removeWhere((element) => element.id == id);
  }

  void editClothe(Clothes clothes, int index) {
    DUMMY_DATA.replaceRange(index, index + 1, [clothes]);
  }
}

