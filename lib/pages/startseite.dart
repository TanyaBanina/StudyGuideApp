import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/day_list.dart';
import 'package:study_guide_app/widgets/event_view.dart';
import 'package:study_guide_app/widgets/event_popup.dart';
import 'package:study_guide_app/widgets/nav-drawer.dart';

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
    "MON,TEST1,TEST1",
    "MIT,TEST2,TEST2",
    "SON,TEST3,TEST3",
    "MIT,TEST4,TEST4",
    "FRE,TEST5,TEST5",
    "DON,TEST6,TEST6",
    "MON,TEST7,TEST7",
    "DIE,TEST8,TEST8",
    "DIE,TEST9,TEST9",
    "DIE,TEST10,TEST10",
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

  void deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      backgroundColor: const Color.fromARGB(255,24, 44, 100),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255,24, 44, 100),
        elevation: 0.0,
        title: const Text("Mein UNI-Tag"),
      ),
      body: Column(
        children: [
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
        splashColor: Colors.deepPurple,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        backgroundColor: const Color.fromARGB(255,24, 44, 100),
        child: const Icon(Icons.add, size: 50,color: Colors.white,),
      ),

    );
  }
}