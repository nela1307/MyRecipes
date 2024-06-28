import 'package:api_restful/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_app.dart';

class MealSearchDelegate extends SearchDelegate{

  String? get searchMealLbl => "Search meals";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: ()=>query = "",
        icon: Icon(Icons.clear),)
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        FocusScope.of(context).unfocus();

        Future.delayed(Duration(seconds: 1), () {
          close(context, null);
        });
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        child: buildSuggestions(context)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty) return _noMeals();
    ProviderApp provider = Provider.of(context,listen: false);
    return FutureBuilder(future: provider.cargarMealSearch(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _mealList(snapshot.data!,context);
          }
          if (snapshot.hasError) {
            return Center(child: Container(child: Text("Error while searching meal")));
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        },
    );
  }

  Widget _noMeals()=> Container(
    child: Center(
      child: Icon(Icons.no_meals,size: 100,color: Colors.black26,),
    ),
  );

  Widget _mealList(List<Meal> list, BuildContext context,) {
    if(list.isEmpty) return Center(child: Container(child: Text("No meals with '$searchMealLbl'")));
    return ListView.separated(
        itemCount: list.length,
        separatorBuilder: (_,__) => Divider(height: 2,thickness: 2,),
        itemBuilder: (context,index) => _elementoLista(list[index],context)

    );
  }

  Widget _elementoLista(Meal meal, BuildContext context) => ListTile(
    leading: Image.network(meal.strMealThumb),
    title: Text(meal.strMeal),);

}