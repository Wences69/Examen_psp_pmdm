import 'package:flutter/material.dart';

import '../CustomViews/CustomButton.dart';
import '../CustomViews/CustomTextField.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecPasswd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Colors.black
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
                  blIsPasswd: false,
                  tecControler: tecPasswd,
                ),

                const SizedBox(height: 25),

                CustomButton(sText: "Login", onTap: null),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "¿No tienes cuenta?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary)),
                    GestureDetector(
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
}
