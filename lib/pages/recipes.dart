import 'package:api_restful/providers/provider_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.dart';

class Recipes extends StatelessWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Recipe>> recipes = ModalRoute.of(context)?.settings.arguments as Future<List<Recipe>>;
    ProviderApp provider = Provider.of(context,listen: false);

    return Scaffold(
      body: Container(
        color: Color.fromARGB(150, 147, 25, 29),
        alignment: Alignment.center,
        child:FutureBuilder(
          future: recipes,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return CircularProgressIndicator();
            }
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              final lista = snapshot.data;

              if (lista!.isEmpty) {
                return CircularProgressIndicator();
              }

              MediaQueryData mqd = MediaQuery.of(context);
              ScrollController sc = ScrollController();
              return SingleChildScrollView(
                controller: sc,
                child: Column(
                  children: [
                    _header(lista[0],mqd),
                    _ingredients(lista[0]),
                    _instructions(lista[0]),
                    IconButton(
                        iconSize: 60,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_circle_left_rounded)
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _header(Recipe recipe, MediaQueryData mqd) {
    print(recipe.idMeal);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 15,),
        Text(recipe.strMeal,style: TextStyle(fontSize: 40,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
        Text("Origin: ${recipe.strArea}",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),textAlign: TextAlign.center),
        SizedBox(height: 10,),
        SizedBox(
          height: mqd.size.height*0.3,
          width: mqd.size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(placeholder: AssetImage("assets/images/loading.gif"),
                image: NetworkImage(recipe.strMealThumb),fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }

  Widget _ingredients(Recipe recipe) {
    ScrollController sc = ScrollController();
    return Column(
      children: [
        Text("Ingredients",style: TextStyle(fontSize: 28,fontStyle: FontStyle.italic),textAlign: TextAlign.center),
        SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: sc,
          child: Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 237, 88, 43),width: 3),borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _columnIz(recipe),
                _columnDer(recipe),
              ],
            ),
          ),
        ),
      ],
    );
  }

 Widget _columnIz(Recipe recipe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textIngredients(recipe.strMeasure1,recipe.strIngredient1),
        _textIngredients(recipe.strMeasure2,recipe.strIngredient2),
        _textIngredients(recipe.strMeasure3,recipe.strIngredient3),
        _textIngredients(recipe.strMeasure4,recipe.strIngredient4),
        _textIngredients(recipe.strMeasure5,recipe.strIngredient5),
        _textIngredients(recipe.strMeasure6,recipe.strIngredient6),
        _textIngredients(recipe.strMeasure7,recipe.strIngredient7),
        _textIngredients(recipe.strMeasure8,recipe.strIngredient8),
        _textIngredients(recipe.strMeasure9,recipe.strIngredient9),
        _textIngredients(recipe.strMeasure10,recipe.strIngredient10),
      ],
    );
  }

  Widget _columnDer(Recipe recipe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _textIngredients(recipe.strMeasure11,recipe.strIngredient11),
        _textIngredients(recipe.strMeasure12,recipe.strIngredient12),
        _textIngredients(recipe.strMeasure13,recipe.strIngredient13),
        _textIngredients(recipe.strMeasure14,recipe.strIngredient14),
        _textIngredients(recipe.strMeasure15,recipe.strIngredient15),
        _textIngredients(recipe.strMeasure16,recipe.strIngredient16),
        _textIngredients(recipe.strMeasure17,recipe.strIngredient17),
        _textIngredients(recipe.strMeasure18,recipe.strIngredient18),
        _textIngredients(recipe.strMeasure19,recipe.strIngredient19),
        _textIngredients(recipe.strMeasure20,recipe.strIngredient20),
      ],
    );
  }


  Widget _textIngredients(String measure, String ingredient) {
    return  Text("$measure  $ingredient",style: TextStyle(fontSize: 16),);
  }

 Widget _instructions(Recipe recipe) {
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 10,left: 15,right: 15),
      child: Text(recipe.strInstructions),
    );
 }



}
