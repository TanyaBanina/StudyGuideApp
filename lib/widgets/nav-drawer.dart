import 'package:flutter/material.dart';
import 'package:study_guide_app/pages/hilfe.dart';
import 'package:study_guide_app/pages/startseite.dart';
import 'package:study_guide_app/pages/veranstaltungen.dart';
import 'package:study_guide_app/pages/ressourcen.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Color.fromARGB(255,24, 44, 100),
                /*image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/.jpg'))*/),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.start),
            title: const Text('Startseite'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Startseite()),);
              },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Veranstaltungen'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Veranstaltungen()),);
              },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Ressourcen'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Ressourcen()),);
              },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Hilfe und Unterstützung'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HilfeUndUnterstutzung()),);
              },
          ),
        ],
      ),
    );
  }
}