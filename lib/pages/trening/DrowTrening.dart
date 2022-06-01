import 'package:flutter/material.dart';
import 'package:untitled/pages/TreningElements.dart';
import 'dart:async';
import 'package:untitled/pages/trening/NewTrening.dart';

class DrowTrening extends StatefulWidget {

  var elements = TreningElements();
  DrowTrening(TreningElements elements)
  {
    this.elements.trening = elements.trening;
  }
  @override
  _DrowTreningState createState() => _DrowTreningState(this.elements);
}

class _DrowTreningState extends State<DrowTrening> {
  var elements = TreningElements();
  late String name_of_new_trening = '';
  _DrowTreningState(TreningElements elements)
  {
    this.elements.trening = elements.trening;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(elements.appbar),
        backgroundColor: Colors.black54,
        centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Удаление тренировки')));
              },)]
      ),
      body: Scaffold(
      body: DrowTreningDayList(elements.trening),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Введите новый раздел'),
              content: TextField(onChanged: (text) {
                if(text != '')
                {
                  String s = text.toString();
                  name_of_new_trening = s;
                }
              },
                  decoration: InputDecoration(
                    labelText: "Введите название раздела",
                    fillColor: Colors.black12,
                    filled: true,
                  )),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Назад'),
                  child: const Text('Назад'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewTrening(name_of_new_trening,  elements.trening);
                  }));
                    },
                  child: const Text('Далее'),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey[800],
          child: const Icon(Icons.add),),
      ));
  }
}


class DrowTreningDayList extends StatefulWidget {
  List <Trenings_Day> trening_day = [Trenings_Day(description: "ddd")];
  DrowTreningDayList(this.trening_day);

  @override
  State<DrowTreningDayList> createState() {
    return _DrowTreningDayListState(this.trening_day);
  }
}

class _DrowTreningDayListState extends State<DrowTreningDayList> {
  List <Trenings_Day> trening_day = [Trenings_Day(description: "ddd")];
  _DrowTreningDayListState(this.trening_day);

  @override


  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: trening_day.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(trening_day[index].image_path))),
              margin: EdgeInsets.all(10),
              child: SizedBox(
                  height: 140,
                  width: 420,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black54),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Container(child: TRENING(trening_day[index]));
                      }));
                    },

                    child:Text(trening_day[index].target_muscle_group, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300), ),
                  )
              )
          );
        });
  }
}


class StateTimer extends StatefulWidget {
  var trening;
  StateTimer({Key? key, this.trening}) : super(key: key);

  @override
  State<StateTimer> createState() => _StateTimerState();
}

class _StateTimerState extends State<StateTimer> {
  Timer? _timer;
  late int wait_time;
  var percent = 1.0;
  var isStart = false;
  var time_str = "05:00";
  @override
  void initState()
  {
    super.initState();
    wait_time = widget.trening.time;
    Calcculation_Time();
  }

  void dispose()
  {
    super.dispose();
    _timer?.cancel();
  }

  void Start(BuildContext context)
  {
    if(wait_time == 0)
    {
      setState(() {
        isStart = true;
      });
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        wait_time += 1;
        Calcculation_Time();
      });
    }
  }

  void Calcculation_Time()
  {
    var minuteStr = (wait_time ~/ 60).toString().padLeft(2,'0');
    var secondStr = (wait_time % 60).toString().padLeft(2,'0');
    setState(() {
      percent = 100;
      time_str = '$minuteStr : $secondStr';
    });
  }

  void Restart()
  {
    wait_time = widget.trening.time;
    Calcculation_Time();
  }

  void Pause()
  {
    _timer?.cancel();
    setState(() {
      isStart = false;
    });
    widget.trening.time = wait_time;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Finish!")));
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.topRight,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: size.height*0.11,
                      width: size.height*0.11,
                      margin: EdgeInsets.all(12),
                      child: CircularProgressIndicator(value: percent,
                        color: Colors.black,
                        backgroundColor: Colors.grey,
                        strokeWidth: 10,
                      ),
                    ),
                    Positioned(
                        child: Text(
                          time_str,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                          textAlign: TextAlign.center,
                        )
                    )
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: size.height*0.07,
                      width: size.height*0.07,
                      margin: EdgeInsets.all(1),
                      child: FloatingActionButton(
                          backgroundColor: Colors.black87,
                          onPressed: () {
                            Restart();
                          },
                          child: Icon(Icons.restart_alt)),
                    ),
                    Container(
                      height: size.height*0.07,
                      width: size.height*0.07,
                      margin: EdgeInsets.all(1),
                      child: FloatingActionButton(
                          backgroundColor: Colors.black87,
                          onPressed: (){
                            isStart? Pause() : Start(context);
                          },
                          child: isStart? Icon(Icons.pause) : Icon(Icons.play_arrow)),
                    ),
                  ]),
            ]
        )
    );
  }
}

class Data_Input extends StatefulWidget {
  int? value_type_of_trening;
  var trening;
  Data_Input({this.value_type_of_trening = 0, this.trening});

  @override
  State<Data_Input> createState() => _Data_InputState(value_type_of_trening: value_type_of_trening, trening: trening);
}

class _Data_InputState extends State<Data_Input> {
  int? value_type_of_trening;
  var trening;
  _Data_InputState({this.value_type_of_trening = 0, this.trening});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: size.height*0.09),
        alignment: Alignment.centerLeft,
        child: Drow_input_form(value_type_of_trening, context,trening)
    );
  }
}

Widget? Drow_input_form(int? value, BuildContext context, Trening trening)
{
  final size = MediaQuery.of(context).size;
  switch(value){

    case 1:
      return Column(
        children: [
          Container(
            height: size.height*0.09,
            width: size.height*0.6,
            margin: EdgeInsets.symmetric(vertical: 1),
            child:
            TextField(
                onChanged: (text) {
                  trening.number_of_repetitions = 0;
                  if(text != '')
                  {
                    String s = text.toString();
                    int s2 = int.parse(s);
                    trening.number_of_repetitions = s2;
                    print("текст ввели $text");
                    print(trening.number_of_repetitions);
                  }
                },
                decoration: InputDecoration(
                  helperText: "Введите количество выполненных повторений",
                  hintText: "Введите повторения",
                  fillColor: Colors.black12,
                  filled: true,
                )),
          ),
          Container(
            height: size.height*0.09,
            width: size.height*0.6,
            margin: EdgeInsets.symmetric(vertical: 1),
            child:
            TextField(onChanged: (text) {
              if(text != '')
              {
                String s = text.toString();
                double s2 = double.parse(s);
                trening.weight = s2;
                print("текст ввели $text");
                print(trening.weight);
              }
            },
                decoration: InputDecoration(
                  helperText: "Введите вес с которым работали",
                  hintText: "Введите вес",
                  fillColor: Colors.black12,
                  filled: true,
                )),
          )
        ],
      );
    case 2:
      return Column(
        children: [
          Container(
            height: size.height*0.09,
            width: size.height*0.6,
            margin: EdgeInsets.symmetric(vertical: 1),
            child: Text("Время автоматически добавится после остановки таймера")
          ),
        ],
      );
    case 3:
      return Column(
        children: [
          Container(
            height: size.height*0.09,
            width: size.height*0.6,
            margin: EdgeInsets.symmetric(vertical: 1),
            child:
            TextField(
                onChanged: (text) {
                  trening.number_of_repetitions = 0;
                  if(text != '')
                  {
                    String s = text.toString();
                    int s2 = int.parse(s);
                    trening.number_of_repetitions = s2;
                    print("текст ввели $text");
                    print(trening.number_of_repetitions);
                  }
                },
                decoration: InputDecoration(
                  helperText: "Введите количество выполненных повторений",
                  hintText: "Введите повторения",
                  fillColor: Colors.black12,
                  filled: true,
                )),
          ),
        ],
      );
    default:
      return Column(
        children: [
          Container(
            height: size.height*0.09,
            width: size.height*0.6,
            margin: EdgeInsets.symmetric(vertical: 1),
            child:
            TextField(
                onSubmitted: (text) {
                  print("onSubmitted");
                  print("Введенный текст: $text");
                },
                onChanged: (text) {
                  print("onChanged");
                  print("Введенный текст: $text");
                },
                decoration: InputDecoration(
                  helperText: "Введите время, затраченное на выполнение упражнения",
                  hintText: "Введите время",
                  fillColor: Colors.black12,
                  filled: true,
                )),
          ),
        ],
      );
  }
}


class TRENING extends StatefulWidget {
  Trenings_Day trening_day = Trenings_Day(description: "ddd");
  TRENING(this.trening_day);
  int wait_time = 3;
  @override
  State<TRENING> createState() => _TRENINGState(this.trening_day);
}

class _TRENINGState extends State<TRENING> {
  int index = 0;
  Trenings_Day trening_day = Trenings_Day(description: "ddd",)..TreningList = [Trening(name:"бббббббб",time: 60, number_of_repetitions: 10),Trening(name:"бббббббб",number_of_repetitions: 10),];
  _TRENINGState(this.trening_day);

  List<Step> create_step(Trenings_Day Day)
  {
    List<Step> step_list = [];
    for(Trening trening in Day.TreningList)
    {
      final step = Step(
          title: Text(trening.name.toString()),
          content: SizedBox(
              height: 420,
              width: 460,
              child: Column(children: [
                Row(children: [
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 160,
                      width: 210,
                      child:
                      Image(
                          image: AssetImage(trening.image_path))),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: StateTimer(trening: trening),),
                ]
                ),
                Container(
                    alignment: Alignment.topRight,
                    child: Data_Input(value_type_of_trening: trening.type_of_trening, trening: trening)
                )
              ])
          ));
      step_list.add(step);
    }
    return step_list;
  }


  @override
  Widget build(BuildContext context) {
    int end = trening_day.TreningList.length - 1;
    return Scaffold(
        appBar: AppBar(
          title: Text(trening_day.target_muscle_group),
          backgroundColor: Colors.black54,
          centerTitle: false,),
        body: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.black,
                  primary: Colors.black
              )
          ),
          child: Stepper(
            steps: create_step(trening_day),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 110,
                    color: Colors.black,
                    margin: EdgeInsets.only(left: 105,),
                    child: TextButton(
                      onPressed: details.onStepContinue,
                      child: index == end ? Text('Закончить', style: TextStyle(fontSize: 18, color: Colors.white),) : Text('Далее', style: TextStyle(fontSize: 18, color: Colors.white),),
                    ),
                  )
                ],
              );
            },
            currentStep: index,
            onStepContinue: () {
              if(trening_day.TreningList[index].type_of_trening == 1)
              {
                if(trening_day.TreningList[index].number_of_repetitions == 0 || trening_day.TreningList[index].weight == 0.0 || trening_day.TreningList[index].time == 0)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Заполните все поля")));
                }
                else {
                  if (index != end) {
                    setState(() {
                      index += 1;
                    });
                  }
                  else {
                    Navigator.pop(context);
                  }
                }
              }
              if(trening_day.TreningList[index].type_of_trening == 2)
              {
                if(trening_day.TreningList[index].time == 0)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Заполните все поля")));
                }
                else {
                  if (index != end) {
                    setState(() {
                      index += 1;
                    });
                  }
                  else {
                    Navigator.pop(context);
                  }
                }
              }
              if(trening_day.TreningList[index].type_of_trening == 3)
              {
                if(trening_day.TreningList[index].number_of_repetitions == 0)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Заполните все поля")));
                }
                else {
                  if (index != end) {
                    setState(() {
                      index += 1;
                    });
                  }
                  else {
                    Navigator.pop(context);
                  }
                }
              }
            },
          ),
        )
    );
  }
}
