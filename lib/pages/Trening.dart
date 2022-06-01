import 'package:flutter/material.dart';
import 'package:untitled/pages/TreningElements.dart';
import 'package:untitled/pages/trening/DrowTrening.dart';

class Trening2 extends StatefulWidget {
  const Trening2({Key? key}) : super(key: key);

  @override
  _TreningState createState() => _TreningState();
}


class _TreningState extends State<Trening2> {
  String appbar = 'Тренировки';
  final TreningList = <TreningElements>[
    TreningElements(image_path: "assets/mass_gain.jpeg",appbar: "НАБОР МАССЫ")..trening = <Trenings_Day>[
      Trenings_Day(
        target_muscle_group: "Ноги",
        time_of_trening: 140,
        tonnage: 5,
        image_path: "assets/mass_gain/legs.jpg",
        description: "Тренировка направлена на проработку грудных мышц и трицепса",
      )..TreningList = [Trening(name:"Разминка: Велотренажёр",type_of_trening: 2,time: 0, image_path: "assets/mass_gain/legs/velo.jpg"),Trening(name:"Приседания со штангой на плечах",type_of_trening: 3,time: 0, image_path: "assets/mass_gain/legs/pris.jpg"),Trening(name:"Разгибания ног в тренажёре",type_of_trening: 1,time: 0, image_path: "assets/mass_gain/legs/rasgib.jpg"),Trening(name:"Сгибания ног в тренажёре",type_of_trening: 1,time: 0,image_path: "assets/mass_gain/legs/sgib.jpg")],
      Trenings_Day(
        target_muscle_group: "Грудь и трицепс",
        time_of_trening: 140,
        tonnage: 5,
        image_path: "assets/mass_gain/pectoral.jpg",
        description: "Тренировка направлена на проработку грудных мышц и трицепса",
      )..TreningList = [Trening(name:"Разминка: Круговые вращения руками",type_of_trening: 1,time: 0),Trening(name:"Разминка: Вращения в локтевых суставах",type_of_trening: 3,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0,)],
      Trenings_Day(
        target_muscle_group: "Спина и бицепс",
        time_of_trening: 140,
        tonnage: 5,
        image_path: "assets/mass_gain/back.jpg",
        description: "Тренировка направлена на проработку грудных мышц и трицепса",
      )..TreningList = [Trening(name:"бббббб", type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1, time: 0)],
      Trenings_Day(
        target_muscle_group: "Плечи и трицепс",
        time_of_trening: 140,
        tonnage: 5,
        image_path: "assets/mass_gain/shoulders.jpg",
        description: "Тренировка направлена на проработку грудных мышц и трицепса",
      )..TreningList = [Trening(name:"бббббб",type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0),Trening(name:"Жим лёжа",type_of_trening: 1,time: 0)],
    ],


    TreningElements(image_path: 'assets/weight_loss.jpeg', appbar: 'КАРДИО')..trening = <Trenings_Day>[
      Trenings_Day(
        target_muscle_group: "Интенсивное кардио",
        time_of_trening: 140,
        tonnage: 5,
        image_path: "",
        description: "",
      )..TreningList = [Trening(name:"Разминка: Велотренажёр",type_of_trening: 2,time: 0, image_path: "assets/mass_gain/legs/velo.jpg"),],
    ],

    TreningElements(image_path: 'assets/general_strengthening.jpeg', appbar: "ОФП и ЛФК")..trening = <Trenings_Day>[
      Trenings_Day(
        target_muscle_group: "Восстановление",
        time_of_trening: 140,
        tonnage: 5,
        image_path: "",
        description: "Тренировка направлена на проработку грудных мышц и трицепса",
      )..TreningList = [Trening(name:"Разминка: Велотренажёр",type_of_trening: 2,time: 0, image_path: "assets/mass_gain/legs/velo.jpg"),],
    ],
    ];
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
                        body: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: TreningList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: AssetImage(TreningList[index].image_path))),
                                  margin: EdgeInsets.all(10),
                                  child: SizedBox(
                                        height: 160,
                                        width: 420,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<Color>(Colors.black54),
                                            ),
                                            onPressed: () {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                                      return DrowTrening(TreningList[index]);
                                                    }));
                                            },

                                          child:Text(TreningList[index].appbar, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300), ),
                                          )
                                        ),
                              );
                            })
                        ),);
  }
}
