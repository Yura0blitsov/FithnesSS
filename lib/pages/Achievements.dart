import 'package:flutter/material.dart';


class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  String appbar = 'Мои достижения';
  late int wait_time;
  var percent = 1.0;
  var isStart = false;
  var time_str = "05:00";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        title: Text(appbar),
         backgroundColor: Colors.black54,
        centerTitle: true,),
        body: Scaffold(
        backgroundColor: Colors.black12,
          body: Container(
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
                                '$percent%',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                ),
                                textAlign: TextAlign.center,
                              )
                          )
                        ]
                    ),
                  ])))
    );
  }
}

