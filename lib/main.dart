import 'package:flutter/material.dart';

import 'package:study_guide_app/widgets/nav-drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Startseite(),
    );
  }
}

class Startseite extends StatelessWidget {
  const Startseite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Startseite'),
      ),
      body: const Center(
        child: Text('aaaaaaa'),
      ),
    );
  }
}

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