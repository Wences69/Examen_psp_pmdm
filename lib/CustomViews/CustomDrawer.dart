import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final List<Widget> children;
  final String sName;
  final String sUsername;

  void Function(int indice)? fOnItemTap;

  CustomDrawer({
    Key? key,
    required this.fOnItemTap,
    this.children = const [],
    this.sName="Invitado",
    this.sUsername="Usuario Invitado"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(sName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  )
              ),
              accountEmail: Text('@$sUsername',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                  )
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                  leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  title: Text("Home",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                      )
                  ),
                  onTap: () => fOnItemTap!(0)
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                  leading: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  title: Text("Settings",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                      )
                  ),
                  onTap: () => fOnItemTap!(1)
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                  leading: Icon(
                      Icons.exit_to_app,
                      color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  title: Text('Cerrar Sesión',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary
                      )
                  ),
                  onTap: () => fOnItemTap!(2)
              ),
            )
          ],
        ),
      ),
    );
  }
}
