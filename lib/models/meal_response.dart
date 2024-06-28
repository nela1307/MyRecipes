import 'dart:convert';

import 'meal.dart';

class MealResponse {
  List<Meal> meals;

  MealResponse({required this.meals});

  factory MealResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonList = json["meals"];
    List<Meal> elemtn = [];

    try {
      jsonList.forEach((element) {
        Meal meal = Meal(
            strMeal: element["strMeal"] ?? '',
            strMealThumb: element["strMealThumb"] ?? '',
            idMeal: element["idMeal"] ?? '');
        elemtn.add(meal);
      });


      return MealResponse(
        meals: elemtn,
      );
    } catch (e) {
      print(e);
    }

    return MealResponse(
      meals: elemtn,
    );
  }

  factory MealResponse.fromRawJson(String str) =>
      MealResponse.fromJson(json.decode(str));
}
