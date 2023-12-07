import 'package:examen_oscar_rueda/Singletone/DataHolder.dart';
import 'package:flutter/material.dart';
import '../CustomViews/CustomButton.dart';
import '../CustomViews/CustomSnackbar.dart';
import '../CustomViews/CustomTextField.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecPasswd = TextEditingController();
  final TextEditingController tecConfirmPasswd = TextEditingController();

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
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                Text(
                  "Registro de usuario",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 50),

                CustomTextField(
                  sHint: "Correo electrónico",
                  blIsPasswd: false,
                  tecControler: tecEmail,
                ),

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

                const SizedBox(height: 10),

                CustomTextField(
                  sHint: "Confirmar contraseña",
                  blIsPasswd: true,
                  tecControler: tecConfirmPasswd,
                ),

                const SizedBox(height: 25),

                CustomButton(sText: "Registrate", onTap: () => registrarUsuario(tecEmail.text, tecPasswd.text)),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿Ya tienes una cuenta?",
                      style: TextStyle(
                        color:
                        Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: goToLogin,
                      child: Text(
                        " Inicia sesión aquí",
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

  // Gestiona el texto de ¿Ya tienes una cuenta? Inicia sesión aquí

  void goToLogin() {
    Navigator.of(context).popAndPushNamed("/loginview");
  }

  // Gestiona el boton de registrarse

  void registrarUsuario(String email, String password) {
    String errorMessage = checkFields();

    if(errorMessage.isNotEmpty){
      CustomSnackbar(sMensaje: errorMessage).show(context);
    }
    else if (errorMessage.isEmpty) {
      Future<String?> result = DataHolder().fbadmin.registrarUsuario(tecEmail.text, tecPasswd.text);
      result.then((mensajeError) {
        if (mensajeError == null || mensajeError.isEmpty) {
          Navigator.of(context).popAndPushNamed("/homeview");
        } else {
          CustomSnackbar(sMensaje: mensajeError).show(context);
        }
      });
    }
  }

  // Comprueba que todos los campos del register esten completos, la ultima comprobación comprueba que las contraseñas coincidan

  String checkFields() {
    StringBuffer errorMessage = StringBuffer();
    if (tecEmail.text.isEmpty && tecPasswd.text.isEmpty && tecConfirmPasswd.text.isEmpty) {
      errorMessage.write('Por favor, complete todos los campos');
    }
    else if (tecEmail.text.isEmpty) {
      errorMessage.write('Por favor, complete el campo de correo electrónico');
    }
    else if (tecPasswd.text.isEmpty) {
      errorMessage.write('Por favor, complete el campo de contraseña');
    }
    else if (tecConfirmPasswd.text.isEmpty) {
      errorMessage.write('Por favor, complete el campo de confirmación de contraseña');
    }
    else if (tecPasswd.text != tecConfirmPasswd.text) {
      errorMessage.write('Las contraseñas no coinciden');
    }
    return errorMessage.toString();
  }
}
