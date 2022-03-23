import 'package:flutter/material.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  String appbar = 'Питание';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appbar),
          backgroundColor: Colors.black54,
          centerTitle: true,
        ),
        body: Scaffold(
          backgroundColor: Colors.black12,
        )
    );
  }
}
