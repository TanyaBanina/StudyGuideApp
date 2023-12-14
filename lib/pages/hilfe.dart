import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/nav-drawer.dart';

class HilfeUndUnterstutzung extends StatelessWidget {
  const HilfeUndUnterstutzung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Hilfe und Unterstützung'),
      ),
      body: const Center(
        child: Text('тут лінки на телефонні номери, студіенрат, студентенверк тощо'),
      ),
    );
  }
}