import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/nav-drawer.dart';

class Veranstaltungen extends StatelessWidget {
  const Veranstaltungen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,24, 44, 100),
        iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        title: const Text('Veranstaltungen', style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 0),
              child: Text('Ferien vom 21.12 bis 03.01.', style: TextStyle(fontSize: 25),),
        ),
      ),
    );
  }
}