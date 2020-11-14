import 'package:flutter/rendering.dart';

class MealDetail {
  final int id;
  final String mealName;
  final int price;
  final String postSciprt;
  final String categoryName;
  final String chefName;
  final String chefImage;
  final bool vegan;
  final List<String> devices;
  final List<String> allergyFoods;
  final List<MenuDetails> menuDetails;

  MealDetail({
    this.id,
    this.mealName,
    this.price,
    this.postSciprt,
    this.categoryName,
    this.chefName,
    this.chefImage,
    this.vegan,
    this.devices,
    this.allergyFoods,
    this.menuDetails,
  });
}

class MenuDetails {
  final String description;
  final String path;

  MenuDetails({
    this.description,
    this.path,
  });
  factory MenuDetails.fromJson(Map<String, dynamic> parsedJson) {
    return MenuDetails(
        description: parsedJson['description'], path: parsedJson['path']);
  }
}
