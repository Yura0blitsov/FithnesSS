import 'package:flutter/material.dart';
import 'package:untitled/pages/trening/DrowTrening.dart';
import 'package:untitled/pages/TreningElements.dart';

class GeneralStrengthening extends StatefulWidget {
  const GeneralStrengthening({Key? key}) : super(key: key);

  @override
  State<GeneralStrengthening> createState() => _GeneralStrengtheningState();
}

class _GeneralStrengtheningState extends State<GeneralStrengthening> {
  @override
  var trenings_days = <Trenings_Day>[
    Trenings_Day(
      target_muscle_group: "Восстановление",
      time_of_trening: 140,
      tonnage: 5,
      image_path: "",
      description: "Тренировка направлена на проработку грудных мышц и трицепса",
    )..TreningList = [Trening(name:"Разминка: Велотренажёр",type_of_trening: 2,time: 0, image_path: "assets/mass_gain/legs/velo.jpg"),],
  ];

  Widget build(BuildContext context) {
    return DrowTreningDayList(trenings_days);
  }
}
