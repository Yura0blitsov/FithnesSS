import 'package:flutter/material.dart';
import 'package:untitled/pages/TreningElements.dart';
import 'package:untitled/pages/trening/DrowTrening.dart';


class NewTrening extends StatefulWidget {
 String? name_of_trening;
 late Widget trening;
 NewTrening(String? name, Widget tren)
 {
   trening = tren;
   this.name_of_trening = name;
 }
  @override
  State<NewTrening> createState() => _NewTreningState(this.name_of_trening, trening);
}

enum SingingCharacter { time, repeat, time_repeat }
class _NewTreningState extends State<NewTrening> {
  SingingCharacter? _character = SingingCharacter.time;
  String? name_of_trening;
  late Widget trening;
  _NewTreningState(String? name, Widget tren)
  {
    trening = tren;
    this.name_of_trening = name;


  }
  late Trening trenings_elements;
  int size_of_trening_list = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавление раздела $name_of_trening"),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height*0.09, left: size.width*0.09, right: size.width*0.09, bottom: size.height*0.01),
            alignment: Alignment.center,
            height: size.height*0.1,
            width: size.width*0.9,
            child:
            TextField(
                onChanged: (text) {
                  trenings_elements.name = '';
                  if(text != '')
                  {
                    trenings_elements.name = text.toString();
                  }
                },
                decoration: InputDecoration(
                  helperText: "Введите название тренировки",
                  hintText: "Введите название",
                  fillColor: Colors.black12,
                  filled: true,
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height*0.01, horizontal: size.width*0.09),
            height: size.height*0.1,
            width: size.width*0.9,
            child:
            TextField(
                onChanged: (text) {
                  trenings_elements.time = 0;
                  if(text != '')
                  {
                    String s = text.toString();
                    int s2 = int.parse(s);
                    trenings_elements.time = s2;
                  }
                },
                decoration: InputDecoration(
                  helperText: "Введите время выполнения упражнения",
                  hintText: "Введите время в секундах",
                  fillColor: Colors.black12,
                  filled: true,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height*0.01, left: size.width*0.09, right: size.width*0.09, bottom: size.height*0.01),
            alignment: Alignment.center,
            height: size.height*0.3,
            width: size.width*0.9,
            child:
            Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Упражнение на время'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.time,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Упражнение на количество повторений'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.repeat,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Упражнение на количество и на время'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.time_repeat,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 110,
            color: Colors.black,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
            child: TextButton(
              onPressed: (){

              },
              child: Text('Далее', style: TextStyle(fontSize: 18, color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}


class New_ extends StatefulWidget {
  const New_({Key? key}) : super(key: key);

  @override
  _New_State createState() => _New_State();
}

class _New_State extends State<New_> {
  void add_trening()
  {

  }
  @override
  var trenings_days = <Trenings_Day>[];
  Widget build(BuildContext context) {
    return DrowTreningDayList(trenings_days);
  }
}