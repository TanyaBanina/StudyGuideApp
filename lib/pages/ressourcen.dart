import 'package:flutter/material.dart';
import 'package:study_guide_app/widgets/nav-drawer.dart';

class Ressourcen extends StatelessWidget {
  const Ressourcen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Ressourcen'),
      ),
      body: const Center(
        child: Text('тут лінки на опал, джехам та інші'),
      ),
    );
  }
}