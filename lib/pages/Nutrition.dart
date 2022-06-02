import 'package:flutter/material.dart';
import 'nutrClasses/ConfigNutrition.dart';

class Nutrition extends StatefulWidget {
  const Nutrition({Key? key}) : super(key: key);

  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  String appbar = 'Питание';

  void startCalc() {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => const ConfigNutrition(),
      ),
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) => StartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appbar),
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                width: 420.0,
                height: 160.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown[200]),
                    shadowColor: MaterialStateProperty.all(Colors.brown),
                  ),
                  onPressed: startCalc,
                  child: Text('Начните следить за своим питанием!',
                      style: TextStyle(
                        color: Colors.brown[900],
                        fontSize: 20.0,
                      )),
                ),
              ),
            )
          ],
        )
    );
  }
}


/* Старый, неизменяемый виджет
class ConfigNutrition extends StatelessWidget {
  const ConfigNutrition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ваша цель тренировки:'),
      actions: [
        ElevatedButton( //шаблон?
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
            shadowColor: MaterialStateProperty.all(Colors.brown),
          ),
          onPressed: () {Navigator.pop(context);},
          child: const Text('Набор массы'),
        ),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            shadowColor: MaterialStateProperty.all(Colors.brown),
          ),
          onPressed: () {Navigator.pop(context);},
          child: const Text('Поддержание фигуры'),
        ),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.amber),
            shadowColor: MaterialStateProperty.all(Colors.brown),
          ),
          onPressed: () {Navigator.pop(context);},
          child: const Text('Похудение'),
        ),
      ],
    );
 */