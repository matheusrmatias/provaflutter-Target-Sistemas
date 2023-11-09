import 'package:flutter/material.dart';
import 'package:prova_flutter/src/themes/main_theme.dart';

class LoginButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final EdgeInsets? margin;
  const LoginButton({super.key, required this.onPressed, required this.text, this.margin});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MainTheme.green,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32),
        ),
        child: Text(widget.text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
