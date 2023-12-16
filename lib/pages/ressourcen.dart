import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/nav-drawer.dart';

class Ressourcen extends StatelessWidget {
  const Ressourcen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,24, 44, 100),
        iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        title: const Text('Ressourcen', style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 0),
              child: Text('https://bildungsportal.sachsen.de/opal/shiblogin?6', style: TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}