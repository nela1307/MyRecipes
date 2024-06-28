import 'dart:async';

import 'package:api_restful/models/category.dart';
import 'package:api_restful/providers/provider_app.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../models/recipe.dart';
import '../search/meal_search_delegate.dart';

class Meals extends StatelessWidget {
  const Meals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;
    ProviderApp provider = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => showSearch(context: context, delegate: MealSearchDelegate()), icon: Icon(Icons.search_outlined)),
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "home");
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "categories");
            },
            icon: Icon(Icons.category_rounded),
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text(categoryName),
      ),
      body: _listaMeals(provider, categoryName),
    );
  }

  Widget _listaMeals(ProviderApp provider, String categoryName) {

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1), () => provider.cargarMeals(categoryName)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          final lista = snapshot.data;

          if (lista!.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          MediaQueryData mqd = MediaQuery.of(context);
          return _carousel(provider, mqd, context);
        }
      },
    );
  }




  Widget _carousel(
      ProviderApp provider, MediaQueryData mqd, BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.65,
        scrollDirection: Axis.vertical,
        autoPlay: false,
        height: mqd.size.height,
        //autoPlayAnimationDuration: Duration(seconds: 1),
      ),
      items: _mealSlider(provider, context),
    );
  }

  List<Widget> _mealSlider(ProviderApp provider, BuildContext context) {
    List<Meal> meals = provider.meals;

    List<Widget> sliders = [];
    meals.forEach((element) {
      sliders.add(Container(
        child: GestureDetector(
          onTap: () {
            Future<List<Recipe>> listaRecipes =
                provider.cargarRecipe(element.idMeal);
            Navigator.pushNamed(context, "recipes", arguments: listaRecipes);
          },
          child: Column(
            children: [
              Image.network(element.strMealThumb, fit: BoxFit.cover),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: Text(element.strMeal,
                      style: TextStyle(
                          fontSize: 25, fontStyle: FontStyle.italic))),
            ],
          ),
        ),
      ));
    });

    return sliders;
  }
}
