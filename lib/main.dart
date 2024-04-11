import 'package:flutter/material.dart';
import 'package:login/Widget/CustomDialog.dart'; // Importa tu CustomDialog.dart aquí
import 'package:login/page/login.dart'; // Supongo que esta es la página de inicio de sesión

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(
                  title: "¡Bienvenido!",
                  content: Builder(
                    builder: (BuildContext context) {
                      return LoginPage(); // Supongo que esta es tu página de inicio de sesión
                    },
                  ),
                  onClosePressed: () {
                    Navigator.of(context).pop(); // Cerrar el diálogo
                  },

                  dialogWidth: 500,
                  showClose: true,
                  // Aquí agregamos el fondo de imagen y el color de la mitad inferior
                  // Color de la mitad inferior
                );
              },
            );
          },
          child: Text('Mostrar Diálogo de Inicio de Sesión'),
        ),
      ),
    );
  }
}
