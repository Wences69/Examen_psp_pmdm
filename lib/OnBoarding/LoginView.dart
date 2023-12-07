import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:flutter/material.dart';
import '../CustomViews/CustomButton.dart';
import '../CustomViews/CustomSnackbar.dart';
import '../CustomViews/CustomTextField.dart';

class LoginView extends StatefulWidget {

  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecPasswd = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                Text(
                  "Inicio de sesión",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 50),

                CustomTextField(
                    sHint: "Correo electrónico", blIsPasswd: false, tecControler: tecEmail),

                const SizedBox(height: 10),

                CustomTextField(
                  sHint: "Contraseña",
                  blIsPasswd: !isPasswordVisible,
                  tecControler: tecPasswd,
                  iconButton: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 25),

                CustomButton(sText: "Inicar sesión", onTap: () => iniciarSesion(tecEmail.text, tecPasswd.text)),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "¿No tienes cuenta?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary)),
                    GestureDetector(
                      onTap: goToRegister,
                      child: Text(
                        " Registrate aquí",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void goToRegister() {
    Navigator.of(context).popAndPushNamed("/registerview");
  }

  void iniciarSesion(String email, String password){
    String errorMessage = checkFields();

    if(errorMessage.isNotEmpty){
      CustomSnackbar(sMensaje: errorMessage).show(context);
    }

    else if(errorMessage.isEmpty) {
      DataHolder().fbadmin.iniciarSesion(email, password);
      Navigator.of(context).popAndPushNamed("/homeview");
    }
  }

  String checkFields() {
    StringBuffer errorMessage = StringBuffer();

    if (tecEmail.text.isEmpty && tecPasswd.text.isEmpty) {
      errorMessage.write('Por favor, complete todos los campos');
    }

    else if (tecEmail.text.isEmpty) {
      errorMessage.write('Por favor, complete el campo de correo electrónico');
    }

    else if (tecPasswd.text.isEmpty) {
      errorMessage.write('Por favor, complete el campo de contraseña');
    }

    return errorMessage.toString();
  }
}