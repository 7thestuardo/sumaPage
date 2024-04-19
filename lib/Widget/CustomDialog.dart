import 'package:flutter/material.dart';
import 'package:login/Widget/PasswordRecoveryWidget.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final Widget content;
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
        child: Container(
          width: widget.dialogWidth,
          child: SingleChildScrollView(
            // Agregamos SingleChildScrollView
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  if (widget.showClose)
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: widget.onClosePressed,
                      ),
                    ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  widget.content,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
