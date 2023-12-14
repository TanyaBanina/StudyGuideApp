import 'package:flutter/material.dart';

class Event extends StatefulWidget {
  final String title;
  final String description;

  const Event({Key? key, required this.title, required this.description}) : super(key: key);

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
      height: 200,
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
            Text(widget.description, style: const TextStyle(color: Colors.black, fontSize: 15,), textAlign: TextAlign.center,),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}