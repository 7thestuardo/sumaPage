import 'package:flutter/material.dart';
import 'package:login/Widget/CustomDialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  title: "Custom Dialog",
                  content: "This is a custom dialog.",
                  onClosePressed: () {
                    Navigator.of(context).pop();
                  },
                  dialogWidth: 1200,
                  showClose: true,
                );
              },
            );
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }
}
