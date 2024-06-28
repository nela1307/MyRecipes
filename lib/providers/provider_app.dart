import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/category_response.dart';
import '../models/meal.dart';
import '../models/meal_response.dart';
import '../models/recipe.dart';
import '../models/recipe_response.dart';

class ProviderApp with ChangeNotifier {
  final key = "1";
  final List<Category> categories = [];
  bool cargadasCategory = false;

  Future<List<Category>> cargarCategory() async {
    if (cargadasCategory) return categories;
    try {
      var url = Uri.https(
        'www.themealdb.com',
        '/api/json/v1/$key/list.php',
        {'c': 'list'},
      );

      cargadasCategory = true;
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final categoryResponse = CategoryResponse.fromRawJson(response.body);

        categories.addAll(categoryResponse.meals);
        cargadasCategory = true;
        return categories;
      }
    } catch (e) {
      print(e);
    }
    return categories;
  }



  List<Meal> meals = [];

  bool cargadasMeal = false;
  String categoriaCargada = "";

  Future<List<Meal>> cargarMeals(String category) async {
    if (category == categoriaCargada) {
      return meals;
    } else {
      meals = [];
      categoriaCargada = category;
      cargadasMeal = false;
    }

    if (cargadasMeal) return meals;

    var url = Uri.https(
        'www.themealdb.com', '/api/json/v1/$key/filter.php', {'c': category});

    cargadasMeal = true;
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final mealResponse = MealResponse.fromRawJson(response.body);

      meals.addAll(mealResponse.meals);
      cargadasMeal = true;
      return meals;
    }

    return meals;
  }

//www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata
  Future<List<Meal>> cargarMealSearch(String startsWith) async{
    var url = Uri.https(
        'www.themealdb.com', '/api/json/v1/$key/search.php', {'s': startsWith});

    var response = await http.get(url);
    if(response.statusCode==200){
      final mealResponse = MealResponse.fromRawJson(response.body);
      return mealResponse.meals;
    }
    return [];

}




  String id = "";

  bool cargadasRecipe = false;
  List<Recipe> recipes = [];

  Future<List<Recipe>> cargarRecipe(String idSelec) async {

    if (id == idSelec) {
      return recipes;
    } else {
      recipes = [];
      id=idSelec;
      cargadasRecipe = false;
    }

    if (cargadasRecipe) return recipes;
    try {
      var url = Uri.https(
        'www.themealdb.com',
        '/api/json/v1/$key/lookup.php',
        {'i': id},
      );

      cargadasRecipe = true;
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final categoryResponse = RecipeResponse.fromRawJson(response.body);

        recipes.addAll(categoryResponse.recipes);
        cargadasRecipe = true;
        return recipes;
      }
    } catch (e) {
      print(e);
    }
    return recipes;
  }
}
