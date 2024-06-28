import 'dart:convert';

import 'package:api_restful/models/recipe.dart';

class RecipeResponse {
  List<Recipe> recipes = [];

  RecipeResponse({required this.recipes});

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonList = json["meals"];

    List<Recipe> elemtn = [];
    jsonList.forEach((element) {
      Recipe recipe = Recipe(
        idMeal: element["idMeal"] ?? '',
        strMeal: element["strMeal"] ?? '',
        strDrinkAlternate: element["strDrinkAlternate"] ?? '',
        strCategory: element["strCategory"] ?? '',
        strArea: element["strArea"] ?? '',
        strInstructions: element["strInstructions"] ?? '',
        strMealThumb: element["strMealThumb"] ?? '',
        strTags: element["strTags"] ?? '',
        strYoutube: element["strYoutube"] ?? '',
        strIngredient1: element["strIngredient1"] ?? '',
        strIngredient2: element["strIngredient2"] ?? '',
        strIngredient3: element["strIngredient3"] ?? '',
        strIngredient4: element["strIngredient4"] ?? '',
        strIngredient5: element["strIngredient5"] ?? '',
        strIngredient6: element["strIngredient6"] ?? '',
        strIngredient7: element["strIngredient7"] ?? '',
        strIngredient8: element["strIngredient8"] ?? '',
        strIngredient9: element["strIngredient9"] ?? '',
        strIngredient10: element["strIngredient10"] ?? '',
        strIngredient11: element["strIngredient11"] ?? '',
        strIngredient12: element["strIngredient12"] ?? '',
        strIngredient13: element["strIngredient13"] ?? '',
        strIngredient14: element["strIngredient14"] ?? '',
        strIngredient15: element["strIngredient15"] ?? '',
        strIngredient16: element["strIngredient16"] ?? '',
        strIngredient17: element["strIngredient17"] ?? '',
        strIngredient18: element["strIngredient18"] ?? '',
        strIngredient19: element["strIngredient19"] ?? '',
        strIngredient20: element["strIngredient20"] ?? '',
        strMeasure1: element["strMeasure1"] ?? '',
        strMeasure2: element["strMeasure2"] ?? '',
        strMeasure3: element["strMeasure3"] ?? '',
        strMeasure4: element["strMeasure4"] ?? '',
        strMeasure5: element["strMeasure5"] ?? '',
        strMeasure6: element["strMeasure6"] ?? '',
        strMeasure7: element["strMeasure7"] ?? '',
        strMeasure8: element["strMeasure8"] ?? '',
        strMeasure9: element["strMeasure9"] ?? '',
        strMeasure10: element["strMeasure10"] ?? '',
        strMeasure11: element["strMeasure11"] ?? '',
        strMeasure12: element["strMeasure12"] ?? '',
        strMeasure13: element["strMeasure13"] ?? '',
        strMeasure14: element["strMeasure14"] ?? '',
        strMeasure15: element["strMeasure15"] ?? '',
        strMeasure16: element["strMeasure16"] ?? '',
        strMeasure17: element["strMeasure17"] ?? '',
        strMeasure18: element["strMeasure18"] ?? '',
        strMeasure19: element["strMeasure19"] ?? '',
        strMeasure20: element["strMeasure20"] ?? '',
        strSource: element["strSource"] ?? '',
        strImageSource: element["strImageSource"] ?? '',
        strCreativeCommonsConfirmed: element["strCreativeCommonsConfirmed"] ?? '',
        dateModified: element["dateModified"] ?? '',
      );

      elemtn.add(recipe);
    });

    return RecipeResponse(
      recipes: elemtn,
    );
  }

  factory RecipeResponse.fromRawJson(String str) =>
      RecipeResponse.fromJson(json.decode(str));
}
