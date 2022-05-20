import 'package:flutter/material.dart';
import 'package:untitled/pages/TreningElements.dart';

class NewTrening extends StatefulWidget {
  const NewTrening({Key? key}) : super(key: key);
  @override
  State<NewTrening> createState() => _NewTreningState();
}

class _NewTreningState extends State<NewTrening> {
  late TreningElements trenings_elements;
  int size_of_trening_list = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавление новой тренировки"),
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
                  trenings_elements.appbar = '';
                  if(text != '')
                  {
                    trenings_elements.appbar = text.toString();
                    print("текст ввели $text");
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
                  if(text != '')
                  {
                    String s = text.toString();
                    int s2 = int.parse(s);
                    size_of_trening_list = s2;
                    print("текст ввели $text");
                  }
                },
                decoration: InputDecoration(
                  helperText: "Введите количество подразделов",
                  hintText: "Введите количество",
                  fillColor: Colors.black12,
                  filled: true,
                )),
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



