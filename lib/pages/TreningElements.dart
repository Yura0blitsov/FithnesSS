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