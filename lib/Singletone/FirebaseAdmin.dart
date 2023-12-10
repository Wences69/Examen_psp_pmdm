import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_oscar_rueda/FirestoreObjects/FbPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'DataHolder.dart';

class FirebaseAdmin {
  FirebaseFirestore db = FirebaseFirestore.instance;

  // Devuelve el ID del usuario logeado

  String? getCurrentUserID(){
    return FirebaseAuth.instance.currentUser?.uid;
  }

  // Devuelve el usuario logeado

  User? getCurrentUser(){
    return FirebaseAuth.instance.currentUser;
  }

  // Devuelve una instancia de la base de datos de autentificación

  FirebaseAuth getFirebaseAuthInstance(){
    return FirebaseAuth.instance;
  }

  // Incia sesión con un correo y una contraseña que se le pasa por parámetro

  Future<String?> iniciarSesion(String email, String password) async {
    String? errorMessage;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Correo no econtrado
        errorMessage ='Ningún usuario encontrado para ese correo electrónico.';
      } else if (e.code == 'wrong-password') {
        // Contraseña incorrecta
        errorMessage ='Contraseña incorrecta proporcionada para ese correo electrónico.';
      } else {
        // Otras excepciones de FirebaseAuth
        errorMessage = 'Error de autenticación: ${e.message}';
      }
    } catch (e) {
      // Otras excepciones no relacionadas con FirebaseAuth
      errorMessage ='Error: $e';
    }
    return errorMessage;
  }

  // Crea un usuario con un correo y una contraseña que se le pasa por parámetro

  Future<String?> registrarUsuario(String email, String password) async {
    String? errorMessage;
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // Contraseña débil
        errorMessage ='La contraseña proporcionada es demasiado débil.';
      } else if (e.code == 'email-already-in-use') {
        // Correo electrónico ya en uso
        errorMessage = 'La cuenta ya existe para ese correo electrónico.';
      } else {
        // Otras excepciones de FirebaseAuth
        errorMessage = 'Error de autenticación: ${e.message}';
      }
    } catch (e) {
      // Otras excepciones no relacionadas con FirebaseAuth
      errorMessage ='Error: $e';
    }
    return errorMessage;
  }

  // Cierra sesión

  void cerrarSesion() async {
    await FirebaseAuth.instance.signOut();
  }

  // Descargar posts

  Future<List<FbPost>> descargarPosts() async {
    CollectionReference<FbPost> ref = db.collection("Posts").withConverter(
      fromFirestore: FbPost.fromFirestore,
      toFirestore: (FbPost post, _) => post.toFirestore(),
    );

    QuerySnapshot<FbPost> querySnapshot = await ref.get();

    // Mapear los documentos a objetos FbPost y devolver una lista
    List<FbPost> posts = querySnapshot.docs.map((doc) => doc.data()).toList();

    return posts;
  }

  // Subir posts

  Future<void> subirPost(FbPost postNuevo) async {
    CollectionReference<FbPost> postsRef = db.collection("Posts").withConverter(
      fromFirestore: FbPost.fromFirestore,
      toFirestore: (FbPost post, _) => post.toFirestore(),
    );

    await postsRef.add(postNuevo);
  }

  // Editar posts

  Future<void> editarPost(String title, String body) async {
    try {
      // Realiza la consulta para encontrar el post con el título y cuerpo específicos
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Posts')
          .where('title', isEqualTo: DataHolder().selectedPost.title)
          .where('body', isEqualTo: DataHolder().selectedPost.body)
          .get();

      // Verifica si hay al menos un documento
      if (querySnapshot.size > 0) {
        // Suponemos que solo hay un documento con esos criterios, puedes ajustar si no es el caso
        String postId = querySnapshot.docs.first.id;
        print('ID del documento encontrado: $postId');

        // Edita el post con el id encontrado
        FirebaseFirestore.instance.collection('Posts').doc(postId).update(
          {
            "title": title.trim(),
            "body": body.trim(),
          },
        );

        print('Post editado exitosamente');
      } else {
        // No se encontraron documentos con el título y cuerpo especificados
        print('No se encontraron documentos con el título y cuerpo especificados');
      }
    } catch (error) {
      print('Error al realizar la consulta o editar el post: $error');
    }
  }

  // Cambiar foto de perfil

  Future<void> editarFotoPerfil(File _imagePreview) async {
    final storageRef = FirebaseStorage.instance.ref();

    String? rutaNube = "${DataHolder().fbadmin.getCurrentUserID()}/img_perfil.png";
    print("RUTA DONDE VA A GUARDARSE LA IMAGEN: "+rutaNube);
    final rutaAFicheroEnNube = storageRef.child(rutaNube);

    final metadata = SettableMetadata(contentType: "image/jpeg");
    try {
      await rutaAFicheroEnNube.putFile(_imagePreview,metadata);
    } on FirebaseException catch (e) {
      print("ERROR AL SUBIR IMAGEN: "+e.toString());
      // ...
    }
    print("SE HA SUBIDO LA IMAGEN");
    String imgUrl=await rutaAFicheroEnNube.getDownloadURL();
    print("URL DE DESCARGA: "+imgUrl);
  }

  Future<String> getLinkAvatar() async {
    Reference ref = FirebaseStorage.instance.ref().child("${DataHolder().fbadmin.getCurrentUserID()}/img_perfil.png");
    return await ref.getDownloadURL();
  }
}