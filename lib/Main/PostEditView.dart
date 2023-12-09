import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:flutter/material.dart';

import '../CustomViews/CustomButton.dart';
import '../CustomViews/CustomTextField.dart';

class PostEditView extends StatelessWidget {
  PostEditView({Key? key}) : super(key: key);
  TextEditingController tecTitle = TextEditingController(text: DataHolder().selectedPost.title);
  TextEditingController tecBody = TextEditingController(text: DataHolder().selectedPost.body);
  // String? selectedPostIndex = DataHolder().selectedPostIdex as String?;
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Edita este post",
            style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
            )
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Estas en modo edición",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 50),

                CustomTextField(
                    sHint: "Titulo del post",
                    blIsPasswd: false,
                    tecControler: tecTitle
                ),

                const SizedBox(height: 10),

                CustomTextField(
                  sHint: "¿Qué esta pasando?",
                  blIsPasswd: false,
                  tecControler: tecBody,
                ),

                const SizedBox(height: 25),

                CustomButton(sText: "Editar post", onTap: editarPost),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Editar posts

  void editarPost() {
    DataHolder().fbadmin.editarPost(tecTitle.text, tecBody.text);
    Navigator.pop(_context);
  }

  // Comprueba que todos los campos del post estén completos

  String checkFields() {
    StringBuffer errorMessage = StringBuffer();
    if (tecTitle.text.isEmpty && tecBody.text.isEmpty) {
      errorMessage.write('Por favor, complete todos los campos');
    }
    else if (tecTitle.text.isEmpty) {
      errorMessage.write('Por favor, complete el campo de título');
    }
    else if (tecBody.text.isEmpty) {
      errorMessage.write('Por favor, complete el campo de cuerpo');
    }
    return errorMessage.toString();
  }
}
