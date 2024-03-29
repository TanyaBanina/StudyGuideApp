import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//this widget shows time and date
class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Text(DateFormat('MM/dd/yyyy | hh:mm:ss').format(DateTime.now()),style: const TextStyle(
          fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white
          ),
        );
      },
    );
  }
}