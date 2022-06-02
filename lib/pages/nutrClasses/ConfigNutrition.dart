import 'package:flutter/material.dart';

class ConfigNutrition extends StatefulWidget {               //создать отдельный файл в папке
  const ConfigNutrition({Key? key}) : super(key: key);

  @override
  _ConfigNutritionState createState() => _ConfigNutritionState();
}

class _ConfigNutritionState extends State<ConfigNutrition> {
  String purpose = 'none';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ваша цель тренировки:'),
      actions: [
        ElevatedButton(                                //шаблон?
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
            shadowColor: MaterialStateProperty.all(Colors.brown),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              purpose = 'mass';
            });
          },
          child: const Text('Набор массы'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            shadowColor: MaterialStateProperty.all(Colors.brown),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              purpose = 'keeping';
            });
          },
          child: const Text('Поддержание фигуры'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            shadowColor: MaterialStateProperty.all(Colors.brown),
          ),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              purpose = 'slimming';
            });
          },
          child: const Text('Похудение'),
        ),
      ],
    );
  }
}