import 'dart:convert';

class Meal {

String strMeal;
String strMealThumb;
String idMeal;

Meal({required this.strMeal, required this.strMealThumb, required this.idMeal});

factory Meal.fromJson(Map<String,dynamic> json) => Meal(
  strMeal: json["strMeal"],
  strMealThumb:  json["strMealThumb"],
  idMeal: json["idMeal"],
);

factory Meal.fromRawJson(String s) => Meal.fromJson(json.decode(s));

}
