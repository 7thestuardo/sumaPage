import 'package:flutter/material.dart';
import 'package:login/Widget/CustomDialog.dart';
import 'package:login/Widget/PasswordRecoveryWidget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _submitted = false; // Track if form is submitted

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _submitted
              ? AutovalidateMode.always
              : AutovalidateMode
                  .disabled, // Only auto-validate after submission
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 60,
                color: Colors.grey[200],
                child: Center(
                  child: TextFormField(
                    controller: emailController,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(fontSize: 12.0),
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      labelStyle: TextStyle(fontSize: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    validator: (value) {
                      if (_submitted && (value == null || value.isEmpty)) {
                        // Validate only after submission
                        return 'Por favor, ingresa tu correo electrónico';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 60,
                color: Colors.grey[200],
                child: Center(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    style: TextStyle(fontSize: 12.0),
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(fontSize: 12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (_submitted && (value == null || value.isEmpty)) {
                        // Validate only after submission
                        return 'Por favor, ingresa tu contraseña';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return CustomDialog(
                  //       title: "",
                  //       onClosePressed: () {
                  //         Navigator.of(context).pop(); // Cerrar el diálogo
                  //       },
                  //       content: Builder(
                  //         builder: (BuildContext context) {
                  //           return PasswordRecoveryWidget(); // Supongo que esta es tu página de inicio de sesión
                  //         },
                  //       ),
                  //     );
                  //     // Mostrar el widget de recuperación de contraseña
                  //   },
                  // );
                },
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _submitted =
                        true; // Set submitted to true when login button is pressed
                  });
                  if (_formKey.currentState!.validate()) {
                    // Validate only after submission
                    // Implementar lógica para iniciar sesión
                    Navigator.of(context)
                        .pop(); // Cerrar el dialog después de iniciar sesión
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[600]!),
                ),
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20.0),
              screenWidth > 600
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0),
                          child: Text(
                            'o',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    )
                  : const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'o',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes implementar la lógica para crear una cuenta
                },
                child: const Text('Crear una cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
