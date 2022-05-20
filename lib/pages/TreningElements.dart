import 'package:flutter/material.dart';
import 'package:untitled/pages/trening/MassGain.dart';

class TreningElements
{
  Widget trening;
  String image_path = "";
  String appbar = "";
  double progress = 0.0;
  TreningElements({this.image_path = "assets/mass_gain.jpeg", this.appbar = "Моя тренировка", this.progress = 0.0, this.trening = const MassGain()});
}

class Trening
{
  Trening({
    this.name,
    this.number_of_repetitions = 0,
    this.time = 0,
    this.image_path = "",
    this.type_of_trening,
    this.weight = 0.0,
  });
  double weight = 0.0;
  int? type_of_trening;
  String? name;
  int? number_of_repetitions = 0;
  String image_path = "";
  int time;
  int time_of_complete = 0;
}

class Trenings_Day {
  Trenings_Day(
      { this.target_muscle_group = "",
        this.time_of_trening = 0,
        this.tonnage = 0.0,
        this.description = "",
        this.image_path = "",
        this.Drow_exercise,
        this.isExpanded=false,
      });

  List<Trening> TreningList = [Trening(name:"бббббббб",number_of_repetitions: 10),Trening(name:"бббббббб",number_of_repetitions: 0),];
  String target_muscle_group = "";
  int time_of_trening = 0;
  double tonnage = 0;
  String description = "";
  String image_path = "";
  Widget? Drow_exercise;
  bool isExpanded;
//Widget image;
}