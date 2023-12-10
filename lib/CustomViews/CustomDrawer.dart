import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final List<Widget> children;
  final String sName;
  final String sUsername;
  final String url;
  final void Function(int indice)? fOnItemTap;
  final void Function()? fOnProfilePictureTap; // Nuevo callback para la foto de perfil

  const CustomDrawer({
    Key? key,
    required this.fOnItemTap,
    this.fOnProfilePictureTap, // Agrega este callback
    this.children = const [],
    required this.url,
    this.sName = "Invitado",
    this.sUsername = "Usuario Invitado",
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
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              accountEmail: Text('@$sUsername',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              currentAccountPicture: GestureDetector(
                onTap: fOnProfilePictureTap,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: _buildProfilePicture(context),
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                onTap: () => fOnItemTap!(0),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                onTap: () => fOnItemTap!(1),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                onTap: () => fOnItemTap!(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture(BuildContext context) {
    if (url.isNotEmpty) {
      return Image.network(url, fit: BoxFit.cover);
    } else {
      return Icon(
        Icons.person,
        color: Theme.of(context).colorScheme.onBackground,
      );
    }
  }
}
