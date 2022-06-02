import 'package:flutter/material.dart';

//String activity = 'none';
String purpose = 'none';
String sex = 'none';
double height = 0.0;
double weight = 0.0;
int kcal = 0;
int age = 0;

class TreningPurpose extends StatelessWidget {
  const TreningPurpose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ваша цель тренировки:'),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
            shadowColor: MaterialStateProperty.all(Colors.brown),
          ),
          onPressed: () {
            purpose = 'mass';
            Navigator.pop(context);
            Navigator.push(context, PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) => const BodyType(),
                ));
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
            Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => const BodyType(),
            ));
            purpose = 'keeping';
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
            Navigator.push(context, PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, _, __) => const BodyType(),
            ));
            purpose = 'slimming';
          },
          child: const Text('Похудение'),
        ),
      ],
    );
  }
}

class BodyType extends StatelessWidget {
  const BodyType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        child: AlertDialog(
          title: const Text(
              'Введите необходимую для расчёта суточного потребления калорий информацию:'),
          actions: [
            TextField(
              enabled: true,
              decoration: const InputDecoration(labelText: 'Ваш пол(male или female):'),
              keyboardType: TextInputType.name,
              onSubmitted: (text) {
                sex = text;
                print('Ваш пол: $sex ?');
              },
            ),
            TextField(
              enabled: true,
              decoration: const InputDecoration(labelText: 'Введите свой возраст:'),
              keyboardType: TextInputType.number,
              onSubmitted: (text) {
                age = int.parse(text);
                print('Ваш возраст: $age ?');
              },
            ),
            TextField(
              enabled: true,
              decoration: const InputDecoration(labelText: 'Введите свой рост в см:'),
              keyboardType: TextInputType.number,
              onSubmitted: (text) {
                height = double.parse(text);
                print('Ваш рост: $height ?');
              },
            ),
            TextField(
              enabled: true,
              decoration: const InputDecoration(labelText: 'Введите свой вес в кг:'),
              keyboardType: TextInputType.number,
              onSubmitted: (text) {
                weight = double.parse(text);
                print('Ваша масса тела: $weight ?');
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                shadowColor: MaterialStateProperty.all(Colors.brown),
              ),
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) => NutritionStatistic(),
                    ));
              },
              child: const Text('Далее'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                shadowColor: MaterialStateProperty.all(Colors.brown),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Назад'),
            ),
          ],
        ));
  }
}

class NutritionStatistic extends StatelessWidget {
  const NutritionStatistic({Key? key}) : super(key: key);

  int kcalCalc()
  {
    if (sex == 'male')
      {
        kcal = ((10*weight + 6.25*height - 5*age + 5)*1.55).toInt();
      }

    if (sex == 'female')
    {
      kcal = ((10*weight + 6.25*height - 5*age - 161)*1.2).toInt();
    }
    return kcal;
  }

  @override
  Widget build(BuildContext context) {
    kcalCalc();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Ваши параметры питания'),
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
                child: Text('Вам необходимо потреблять $kcal в сутки'),
              ),
            )
          ],
        )
    );
  }
}