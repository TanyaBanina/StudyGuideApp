import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/nav-drawer.dart';

class Veranstaltungen extends StatelessWidget {
  const Veranstaltungen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Veranstaltungen'),
      ),
      body: const Center(
        child: Text('тут можна усіляку інфу про те що в уніку відбувається писати'),
      ),
    );
  }
}