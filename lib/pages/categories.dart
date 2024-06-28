import 'package:api_restful/providers/provider_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../models/category_response.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    ProviderApp provider = Provider.of(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "home");
              },
              icon: Icon(Icons.home),
            )
          ],
          automaticallyImplyLeading: false,
          title: Text('CATEGORIES'),
        ),
        body: Column(
          children: [
            _imagen(),
            _listaCategories(provider),
          ],
        ));
  }

  Widget _imagen() {
    return Image.asset("assets/images/categories.png");
  }

  Widget _listaCategories(ProviderApp provider) {
    return FutureBuilder(
      future: provider.cargarCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("hay un error");
        }
        if (!snapshot.hasData) {
          return Text("no hay datos que mostrar");
        }

        final lista = snapshot.data as List<Category>;

        if (lista.isEmpty) {
          return Text("Está vacío");
        }
        ScrollController sc = ScrollController();
        MediaQueryData mqd = MediaQuery.of(context);

        return Consumer<ProviderApp>(
          builder: (context, value, child) => SizedBox(
            height: mqd.size.height * 0.6,
            child: ListView.builder(
              controller: sc,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "meals",
                      arguments: lista[index].strCategory);
                },
                tileColor: index % 2 == 0
                    ? Color.fromARGB(200, 237, 88, 43)
                    : Color.fromARGB(200, 147, 25, 29),
                title: Text(
                  lista[index].strCategory,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              itemCount: lista.length,
              padding: EdgeInsets.all(2),
            ),
          ),
        );
      },
    );
  }
}
