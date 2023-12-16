import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/event.dart';

//this widget creates a block with events
class EventView extends StatefulWidget {
  List<String> todoList;
  List<String> bigList;
  EventView({Key? key, required this.todoList, required this.bigList }) : super(key: key);
  
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length, 
      itemBuilder: (BuildContext context, int index) {
        return Event(
          title: widget.todoList[index].split(",")[1],
          description: widget.todoList[index].split(",")[2],
          //delete event on double tap
          onDoubleTap: () {
            setState(() {
              widget.bigList.remove(widget.todoList[index]);
              widget.todoList.removeAt(index);
            });
          },
        );
      },
    );
  }
}
