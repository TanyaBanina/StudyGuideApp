import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//this widget creates an interactable list of weekdays
class DayList extends StatefulWidget {

  final Function dayUpdateFunction;
  const DayList({Key? key, required this.dayUpdateFunction}) : super(key: key);

  @override
  _DayListState createState() => _DayListState();
}

class _DayListState extends State<DayList> {

  List<String> weekdays = ["MON", "DIE", "MIT", "DON", "FRE", "SAM", "SON"];

  Color activeCardColor = Colors.white;
  Color inactiveCardColor = Colors.black45;

  Color activeTextColor = Colors.black;
  Color inactiveTextColor = Colors.white;

  List<List<Color>> cardColorList = [
    [Colors.black45, Colors.white],
    [Colors.black45, Colors.white],
    [Colors.black45, Colors.white],
    [Colors.black45, Colors.white],
    [Colors.black45, Colors.white],
    [Colors.black45, Colors.white],
    [Colors.black45, Colors.white],
  ];

  late DateTime date;

  void updateDayColor(int index) {
    setState(() {
      for (int i = 0; i < cardColorList.length; i++) {
        cardColorList[i][0] = inactiveCardColor;
        cardColorList[i][1] = inactiveTextColor;
      }

      cardColorList[index][0] = activeCardColor;
      cardColorList[index][1] = activeTextColor;
    });
  }

  @override
  void initState() {
    super.initState();
    //this sets the day to current day, when user opens the app
    SchedulerBinding.instance.addPostFrameCallback((_) {
      date = DateTime.now();
      widget.dayUpdateFunction(weekdays[date.weekday - 1]);
      updateDayColor(date.weekday - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekdays.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              updateDayColor(index);
              widget.dayUpdateFunction(weekdays[index]);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 70,
              width: 50,
              decoration: BoxDecoration(
                  color: cardColorList[index][0],
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Center(
                child: Text(weekdays[index], style: TextStyle(fontSize: 17, color: cardColorList[index][1], fontWeight: FontWeight.bold),),
              ),
            ),
          );
        },
      ),
    );
  }
}