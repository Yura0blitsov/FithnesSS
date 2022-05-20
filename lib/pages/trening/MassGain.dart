import 'package:flutter/material.dart';
import 'package:untitled/pages/trening/DrowTrening.dart';
import 'package:untitled/pages/TreningElements.dart';


class MassGain extends StatefulWidget {
  const MassGain({Key? key}) : super(key: key);

  @override
  _MassGainState createState() => _MassGainState();
}

class _MassGainState extends State<MassGain> {
  @override
  var trenings_days = <Trenings_Day>[
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
  ];

  Widget build(BuildContext context) {
    return DrowTreningDayList(trenings_days);
  }
}
