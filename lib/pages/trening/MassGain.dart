import 'package:flutter/material.dart';

class MassGain extends StatefulWidget {
  const MassGain({Key? key}) : super(key: key);

  @override
  _MassGainState createState() => _MassGainState();
}

class _MassGainState extends State<MassGain> {
  @override
  var trenings_days = <Trenings_Day>[
    Trenings_Day(target_muscle_group: "Грудь и трицепс", time_of_trening: 140, tonnage: 5, image_path: "", description: "Жим лёжа на горизонтальной скамье",),
    Trenings_Day(target_muscle_group: "Ноги и плечи", time_of_trening: 4.5, tonnage: 5, description: "АААААААА"),
    Trenings_Day(target_muscle_group: "Спина и бицепс", time_of_trening: 4.5, tonnage: 5, description: "АААААААА"),
  ];


  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              trenings_days[index].isExpanded = !isExpanded;
            });
          },
          children: trenings_days.map<ExpansionPanel>((Trenings_Day item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("Тренировка: " + item.target_muscle_group),
                );
              },
              body: Column(
              children:  [
                ListTile(
                  title: Text(item.description),
                  onTap: () {
                    setState(() {

                    });
                  }),
                  ListTile(
                  title: Text(item.description),
                  onTap: () {
                    setState(() {

                    });
                  })
              ]),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        )
      ),

    );
  }
}



class Trenings_Day
{
  Trenings_Day({this.target_muscle_group = "", this.time_of_trening = 0.0, this.tonnage = 0.0, this.image_path = "", this.description = "", this.Drow_exercise, this.isExpanded = false,});
  String target_muscle_group = "";
  double time_of_trening = 0.0;
  double tonnage = 0;
  String image_path = "";
  String description = "";
  Widget ?Drow_exercise;
  bool isExpanded;

}



