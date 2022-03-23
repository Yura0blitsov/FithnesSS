import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  String appbar = 'Мои достижения';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(appbar),
         backgroundColor: Colors.black54,
        centerTitle: true,),
        body: Scaffold(
        backgroundColor: Colors.black12,
        )
    );
  }
}


