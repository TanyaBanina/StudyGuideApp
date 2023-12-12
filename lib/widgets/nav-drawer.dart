import 'package:flutter/material.dart';

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
                color: Colors.green,
                /*image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/.jpg'))*/),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Information'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.comment),
            title: const Text('Kommunikation'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Ressourcen'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}