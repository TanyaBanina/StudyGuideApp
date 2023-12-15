import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/day_list.dart';
import 'package:study_guide_app/widgets/event_view.dart';
import 'package:study_guide_app/widgets/event_popup.dart';
import 'package:study_guide_app/widgets/nav-drawer.dart';
import 'package:study_guide_app/widgets/clock_widget.dart';

class Startseite extends StatefulWidget {
  const Startseite({Key? key}) : super(key: key);

  @override
  _StartseiteState createState() => _StartseiteState();
}

class _StartseiteState extends State<Startseite> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<String> dayDependentTodos = [];

  List<String> events = [
    "MON,DIS ÜBUNG,2.DS WIL/C107/U",
    "MON,LA VORLESUNG,3.DS HSZ/0002",
    "MON,EMI ÜBUNG,4.DS APB-E042",
    "MIT,DIS VORLESUNG,3.DS HSZ/0002",
    "DON,EMI VORLESUNG,2.DS HSZ/0003",
    "FRE,AUD VORLESUNG,2.DS HSZ/AUDI",
    "FRE,DIS VORLESUNG,3.DS HSZ/0002",
  ];

  String weekday = "";

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.redAccent),
            )
        )
    );
  }

  void changeWeekday(String newDay) {
    setState(() {
      weekday = newDay;
    });
    updateList();
  }

  void updateList() {
    dayDependentTodos.clear();
    for (int i = 0; i < events.length; i++) {
      if (events[i].split(",")[0] == weekday) {
        dayDependentTodos.add(events[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      backgroundColor: const Color.fromARGB(255,24, 44, 100),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text("Mein UNI-Tag", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const ClockWidget(),
          const SizedBox(height: 20,),
//aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          Expanded(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              boxShadow: [BoxShadow(blurRadius: 10.0)]
              ),
            child: const Padding(
              padding: EdgeInsets.only(left: 25.0, right: 10.0, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: Muster Mann',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Matrikelnummer: 1234567',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'S-Nummer: 1234567',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Studiengang: Informatik',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Fachsemester: 1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 23.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          DayList(dayUpdateFunction: changeWeekday,),
          const SizedBox(height: 20,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                boxShadow: [BoxShadow(blurRadius: 10.0)]
              ),
              child: EventView(todoList: dayDependentTodos, bigList: events),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return EventPopup(titleController: titleController, descriptionController: descriptionController,);
            }
          ).then((value) {
            setState(() {
              if (descriptionController.text == "" || titleController.text == "") {
                showInSnackBar("Titel oder Beschreibung dürfen nicht leer sein!");
              } else {
                events.add("$weekday,${titleController.text},${descriptionController.text}");
                updateList();
                titleController.clear();
                descriptionController.clear();
              }
            });
          });
        },
        splashColor: Colors.blue,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        backgroundColor: const Color.fromARGB(255,24, 44, 100),
        child: const Icon(Icons.add, size: 50,color: Colors.white,),
      ),

    );
  }
}