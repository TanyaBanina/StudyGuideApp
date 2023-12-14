import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/event.dart';
class EventView extends StatefulWidget {
  List<String> todoList;
  EventView({Key? key, required this.todoList}) : super(key: key);

  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return Event(title: widget.todoList[index].split(",")[1], description: widget.todoList[index].split(",")[2]);
      },
    );
  }
}