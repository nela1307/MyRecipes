import 'package:api_restful/pages/home.dart';
import 'package:api_restful/pages/recipes.dart';
import 'package:api_restful/pages/meals.dart';
import 'package:api_restful/providers/provider_app.dart';
import 'package:api_restful/pages/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MisProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
         appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(
             255, 237, 88, 43))
      ),
      title: 'MEALS',
      initialRoute: "home",
      routes: {
        "home" : (context) => Home(),
        "categories" : (context) => Categories(),
        "meals" : (context) => Meals(),
        "recipes" : (context) => Recipes()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MisProviders extends StatelessWidget {
  const MisProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProviderApp(),),
    ],
      child: MyApp(),
    );

  }
}

