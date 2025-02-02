import 'dart:convert';

import 'package:bisrepetita/tools.dart';
import 'package:flutter/cupertino.dart';

class Category extends ChangeNotifier {
  late CategoryObj currentCategory;
  late List<CategoryObj> allCategories;

  void loadAllCategory(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/questions/categories.json");
    Map<String, dynamic> json = jsonDecode(data);
    List<dynamic> categories = json["categories"];
    allCategories = _castListJsonToCategoryObj(categories);
    currentCategory = allCategories.first;
  }

  List<CategoryObj> getRandomCategories(int nb) {
    return randomItemsInList(allCategories, nb);
  }

  List<CategoryObj> _castListJsonToCategoryObj(List<dynamic> listObj) {
    List<CategoryObj> catList = [];
    for (final obj in listObj) {
      catList.add(CategoryObj(obj["id"], obj["icon"], obj["en_label"],
          obj["fr_label"], obj["folder"]));
    }
    return catList;
  }
}

class CategoryObj {
  final String id;
  final String icon;
  final String en_label;
  final String fr_label;
  final String folder;
  late String label;

  CategoryObj(this.id, this.icon, this.en_label, this.fr_label, this.folder);

  @override
  String toString() {
    return "\nid: ${this.id}, icon : ${this.icon}, en_label : ${this.en_label}, fr_label : ${this.fr_label}, folder : ${this.folder}";
  }
}
