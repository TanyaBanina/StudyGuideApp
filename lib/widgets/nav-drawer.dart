import 'package:flutter/material.dart';
import 'package:study_guide_app/pages/hilfe.dart';
import 'package:study_guide_app/pages/startseite.dart';
import 'package:study_guide_app/pages/veranstaltungen.dart';
import 'package:study_guide_app/pages/ressourcen.dart';

//this widget creates a menu
class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('lib/assets/tu.jpeg'))),
            child: Container(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Startseite',style: TextStyle(fontSize: 20),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Startseite()),);
              },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Veranstaltungen',style: TextStyle(fontSize: 20),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Veranstaltungen()),);
              },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Ressourcen',style: TextStyle(fontSize: 20),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Ressourcen()),);
              },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Hilfe und Unterstützung',style: TextStyle(fontSize: 20),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HilfeUndUnterstutzung()),);
              },
          ),
        ],
      ),
    );
  }
}