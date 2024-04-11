import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onClosePressed;
  final double dialogWidth;
  final bool showClose;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onClosePressed,
    this.dialogWidth = 300.0,
    this.showClose = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: BoxConstraints(maxWidth: dialogWidth),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Alinea los elementos a la derecha
                children: [
                  if (showClose)
                    Expanded(
                      child: Container(),
                    ), // Este contenedor ocupa todo el espacio disponible
                  if (showClose) _buildCloseButton(),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20),
              Text(content),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: onClosePressed,
        iconSize: 24,
      ),
    );
  }
}
