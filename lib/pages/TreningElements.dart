import 'package:flutter/material.dart';

class TreningElements
{
  List<Trenings_Day> trening =[
  Trenings_Day(
  target_muscle_group: "Ноги",
  time_of_trening: 140,
  tonnage: 5,
  image_path: "assets/mass_gain/legs.jpg",
  description: "Тренировка направлена на проработку грудных мышц и трицепса",
  )..TreningList = [Trening(name:"Разминка: Велотренажёр",type_of_trening: 2,time: 0, image_path: "assets/mass_gain/legs/velo.jpg"),Trening(name:"Приседания со штангой на плечах",type_of_trening: 3,time: 0, image_path: "assets/mass_gain/legs/pris.jpg"),Trening(name:"Разгибания ног в тренажёре",type_of_trening: 1,time: 0, image_path: "assets/mass_gain/legs/rasgib.jpg"),Trening(name:"Сгибания ног в тренажёре",type_of_trening: 1,time: 0,image_path: "assets/mass_gain/legs/sgib.jpg")],
  ];
  String image_path = "";
  String appbar = "";
  double progress = 0.0;
  TreningElements({this.image_path = "assets/mass_gain.jpeg", this.appbar = "Моя тренировка", this.progress = 0.0});
}

class Trening
{
  Trening({
    this.name,
    this.number_of_repetitions = 0,
    this.time = 0,
    this.image_path = "",
    this.type_of_trening = 1,
    this.weight = 0.0,
  });
  double weight = 0.0;
  int type_of_trening = 1;
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
  int complate = 0;
  String description = "";
  String image_path = "";
  Widget? Drow_exercise;
  bool isExpanded;
//Widget image;
}