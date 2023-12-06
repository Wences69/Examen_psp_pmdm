import 'package:flutter/material.dart';

import '../CustomViews/CustomButton.dart';
import '../CustomViews/CustomTextField.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final TextEditingController tecUsername = TextEditingController();
  final TextEditingController tecEmail = TextEditingController();
  final TextEditingController tecPasswd = TextEditingController();
  final TextEditingController tecConfirmPasswd = TextEditingController();

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
                  sHint: "Nombre",
                  blIsPasswd: false,
                  tecControler: tecUsername,
                ),

                const SizedBox(height: 10),

                CustomTextField(
                  sHint: "Correo electrónico",
                  blIsPasswd: false,
                  tecControler: tecEmail,
                ),

                const SizedBox(height: 10),

                CustomTextField(
                  sHint: "Contraseña",
                  blIsPasswd: false,
                  tecControler: tecPasswd,
                ),

                const SizedBox(height: 10),

                CustomTextField(
                  sHint: "Confirm Password",
                  blIsPasswd: true,
                  tecControler: tecConfirmPasswd,
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot password?"),
                  ],
                ),

                const SizedBox(height: 25),

                CustomButton(sText: "Register", onTap: null),

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
                      child: Text(
                        " Inicia sesión aqui",
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
