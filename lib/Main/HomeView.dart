import 'package:examen_oscar_rueda/CustomViews/CustomBottomMenu.dart';
import 'package:examen_oscar_rueda/CustomViews/CustomDrawer.dart';
import 'package:examen_oscar_rueda/CustomViews/PostGridView.dart';
import 'package:examen_oscar_rueda/CustomViews/PostListView.dart';
import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../FirestoreObjects/FbPost.dart';
import '../OnBoarding/LoginView.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<FbPost> posts = [];
  late Future<List<FbPost>> futurePosts;
  bool blIsList = true;
  Reference  ref = FirebaseStorage.instance.ref().child("${DataHolder().fbadmin.getCurrentUserID()}/img_perfil.png");
  String fotoPerfil="";

  @override
  void initState() {
    super.initState();
    cargarPosts();
    fotoPerfilDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "H O M E",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: listOrGrid(blIsList),
        drawer: CustomDrawer(fOnItemTap: onDrawerPressed, fOnProfilePictureTap: onDrawerProfilePressed, url: fotoPerfil),
        bottomNavigationBar: CustomBottomMenu(fOnItemTap: onBottomMenuPressed),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/postcreateview");
          },
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }

  // Espera a cargarPosts()

  Future<void> onRefresh() async {
    await cargarPosts();
  }

  // Consigue la url de la foto de perfil

  Future<void> fotoPerfilDrawer() async {
    fotoPerfil = await DataHolder().fbadmin.getLinkAvatar();
  }
  // Gestion de los botones del Drawer

  void onDrawerPressed(int indice) async {
    if (indice == 0) {
      Navigator.pop(context);
    } else if (indice == 1) {
      Navigator.of(context).pushNamed("/settingsview");
    } else if (indice == 2) {
      DataHolder().fbadmin.cerrarSesion();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => const LoginView()),
        ModalRoute.withName("/loginview"),
      );
    }
  }

  // Gestion de el cambio de imagen de perfil

  void onDrawerProfilePressed() {
    Navigator.of(context).pushNamed("/profileimagechangeview");
  }

  // Gestion de los botones del BottomMenu

  void onBottomMenuPressed(int indice) {
    setState(() {
      if (indice == 0) {
        blIsList = true;
      } else if (indice == 1) {
        blIsList = false;
      } else if (indice == 2) {
        SystemNavigator.pop(); // Cerrar la aplicación
      }
    });
  }

  // Gestiona el click del post

  void onPostPressed(int index) {
    DataHolder().selectedPost = posts[index];
    Navigator.of(context).pushNamed("/postview");
  }

  // Gestiona el click mantenido del post

  void onPostLongPressed(int index) {
    DataHolder().selectedPost = posts[index];
    Navigator.of(context).pushNamed("/posteditview");
  }

  // Creador de items en forma de celda

  Widget? itemGridBuilder(BuildContext context, int index) {
    return PostGridView(
        sTitle: posts[index].title,
        sBody: posts[index].body,
        iPosicion: index,
        fOnItemTap: onPostPressed,
        fOnItemLongPressed: onPostLongPressed
    );
  }

  // Creador de items en forma de lista

  Widget? itemListBuilder(BuildContext context, int index) {
    return PostListView(
        sTitle: posts[index].title,
        sBody: posts[index].body,
        iPosicion: index,
        fOnItemTap: onPostPressed,
        fOnItemLongPressed: onPostLongPressed
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
    futurePosts = DataHolder().fbadmin.descargarPosts();
    List<FbPost> listaPosts = await futurePosts;
    setState(() {
      posts.clear();
      posts.addAll(listaPosts);
    });

  }

  // Cambia entre ListView o GridView

  Widget? listOrGrid(bool blIsList) {
    late Widget builder;
    if (blIsList) {
      builder = ListView.separated(
          padding: const EdgeInsets.all(8),
          itemBuilder: itemListBuilder,
          separatorBuilder: separadorLista,
          itemCount: posts.length
      );
    }
    else {
      builder = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: itemGridBuilder,
        itemCount: posts.length,
      );
    }
    return builder;
  }
}
