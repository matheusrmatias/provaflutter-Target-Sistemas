import 'package:flutter/material.dart';

class TextInfoInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final EdgeInsets? margin;
  final Function(String)? onFieldSubmitted;
  final String? hintText;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool? autoFocus;

  const TextInfoInput({
    super.key, required this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.margin,
    this.hintText,
    this.focusNode,
    this.autoFocus
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        focusNode: focusNode,
        autofocus: autoFocus??false,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            errorStyle: const TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.zero,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide.none
            )
        ),
      ),
    );
  }
}
