import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginInput extends StatelessWidget {
  final TextEditingController controller;
  final Icon? icon;
  final String? Function(String?)? validator;
  final bool? obscure;
  final EdgeInsets? margin;
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLenght;
  final bool? counterText;
  final Function(String)? onSubmitted;
  final String? hintText;

  const LoginInput(
      {super.key,
      required this.controller,
      required this.label,
      this.icon,
      this.validator,
      this.obscure,
      this.margin,
      this.inputFormatters,
      this.maxLenght,
      this.counterText,
      this.onSubmitted,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Row(children: [
            const SizedBox(width: 8),
            Flexible(
                child: Text(label,
                    style: const TextStyle(color: Colors.white, fontSize: 16)))
          ]),
          Padding(
            padding: const EdgeInsets.all(4),
            child: TextFormField(
              inputFormatters: inputFormatters,
              validator: validator,
              controller: controller,
              obscureText: obscure ?? false,
              maxLength: maxLenght,
              onFieldSubmitted: onSubmitted,
              decoration: InputDecoration(
                  hintText: hintText,
                  filled: true,
                  counterText: counterText ?? false ? null : '',
                  prefixIcon: icon,
                  fillColor: Colors.white,
                  errorStyle: const TextStyle(color: Colors.red),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide.none)),
            ),
          )
        ],
      ),
    );
  }
}
