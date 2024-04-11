import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final Widget content;
  final VoidCallback onClosePressed;
  final double dialogWidth;
  final bool showClose;
  final Color? backgroundColor; // Nuevo parámetro para el color de fondo
  final DecorationImage?
      backgroundImage; // Nuevo parámetro para la imagen de fondo

  const CustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onClosePressed,
    this.dialogWidth = 300.0,
    this.showClose = true,
    this.backgroundColor, // Agregar el parámetro opcional
    this.backgroundImage, // Agregar el parámetro opcional
  }) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
          reverseCurve: Curves.fastOutSlowIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Dialog(
        backgroundColor: widget.backgroundColor, // Establecer el color de fondo
        child: Container(
          width: widget.dialogWidth,
          decoration: BoxDecoration(
            image: widget.backgroundImage, // Establecer la imagen de fondo
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.showClose) _buildCloseButton(),
                    ],
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 2),
                  widget.content,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center, // Centra el contenido del contenedor
        child: Center(
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: widget.onClosePressed,
            iconSize: 16,
          ),
        ),
      ),
    );
  }
}
