import 'package:flutter/material.dart';
import 'package:untitled/pages/trening/DrowTrening.dart';
import 'package:untitled/pages/TreningElements.dart';

class WeightLoss extends StatefulWidget {
  const WeightLoss({Key? key}) : super(key: key);

  @override
  _WeightLossState createState() => _WeightLossState();
}

class _WeightLossState extends State<WeightLoss> {
  var trenings_days = <Trenings_Day>[
    Trenings_Day(
      target_muscle_group: "Интенсивное кардио",
      time_of_trening: 140,
      tonnage: 5,
      image_path: "",
      description: "",
    )..TreningList = [Trening(name:"Разминка: Велотренажёр",type_of_trening: 2,time: 0, image_path: "assets/mass_gain/legs/velo.jpg"),],
    ];

  Widget build(BuildContext context) {
    return DrowTreningDayList(trenings_days);
  }
}


