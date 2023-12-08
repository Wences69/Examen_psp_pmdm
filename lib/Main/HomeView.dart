import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_oscar_rueda/CustomViews/CustomBottomMenu.dart';
import 'package:examen_oscar_rueda/CustomViews/CustomDrawer.dart';
import 'package:examen_oscar_rueda/CustomViews/PostListView.dart';
import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../FirestoreObjects/FbPost.dart';
import '../OnBoarding/LoginView.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<FbPost> posts = [];
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    cargarPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("H O M E",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
        )
      ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8),
        separatorBuilder: separadorLista,
        itemBuilder: itemListBuilder,
        itemCount: posts.length,
      ),
      drawer: CustomDrawer(fOnItemTap: onDrawerPressed),
      bottomNavigationBar: CustomBottomMenu(onBotonesClicked: onBottomMenuPressed),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }

  // Gestion de los botones del Drawer

  void onDrawerPressed(int indice) async {
    if (indice == 0) {
      Navigator.pop(context);
    } else if (indice == 1) {
      // Lógica para el botón 1 del Drawer
    } else if (indice == 2) {
      DataHolder().fbadmin.cerrarSesion();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginView()),
        ModalRoute.withName('/loginview'),
      );
    }
  }

  // Gestion de los botones del BottomMenu

  void onBottomMenuPressed(int indice) {
    if (indice == 0) {
      
    } else if (indice == 1) {
      
    } else if (indice == 2) {
      SystemNavigator.pop(); // Cerrar la aplicación
    }
  }

  // Creador de items en forma de lista

  Widget? itemListBuilder(BuildContext context, int index) {
    return PostListView(
        sText: posts[index].title,
    );
  }

  // Creador del separador de lista

  Widget separadorLista(BuildContext context, int index) {
    return Divider(
      thickness: 2,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  // Llena la lista de posts

  Future<void> cargarPosts() async {
    Future<List<FbPost>> futurePosts = DataHolder().fbadmin.descargarPosts();
    List<FbPost> listaPosts = await futurePosts;

    setState(() {
      posts.clear();
      posts.addAll(listaPosts);
    });
  }
}
