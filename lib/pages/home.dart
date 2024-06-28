import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 75,
              child: Image.asset("assets/images/logo.png")),
          Expanded(
            flex: 25,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "categories");
                },
                child: Text("START EXPLORING!",style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 147, 25, 29),
                  minimumSize: Size(170, 170),
                  elevation: 12,
                  shape: OvalBorder(eccentricity: 0.9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
