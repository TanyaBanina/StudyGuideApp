import 'package:flutter/material.dart';

//this widget creates a popup, when user presses the add event button
class EventPopup extends StatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  const EventPopup({Key? key, required this.titleController, required this.descriptionController}) : super(key: key);

  @override
  _EventPopupState createState() => _EventPopupState();
}

class _EventPopupState extends State<EventPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255,51,101,145),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            const Text("Veranstaltung hinzufügen", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.center,),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: widget.titleController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  labelText: "Titel",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: widget.descriptionController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  labelText: "Beschreibung",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(51,101,145,255),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold)
              ),
              child: const Text("HINZUFÜGEN", style: TextStyle(
                color: Colors.white, // Set your desired text color
              ),),
              onPressed:  () => Navigator. pop(context, false),
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}