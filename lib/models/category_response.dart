import 'dart:convert';

import 'package:api_restful/models/category.dart';

class CategoryResponse {
  List<Category> meals;

  CategoryResponse({required this.meals});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonList = json["meals"];

    List<Category> elemtn = [];
    jsonList.forEach((element) {
      Category categoryName = Category(strCategory: element["strCategory"]);
      elemtn.add(categoryName);
    });

    return CategoryResponse(
      meals: elemtn,
    );
  }

  factory CategoryResponse.fromRawJson(String str) =>
      CategoryResponse.fromJson(json.decode(str));
}
