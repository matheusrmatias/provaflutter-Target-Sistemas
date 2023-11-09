import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginInput extends StatefulWidget {
  final TextEditingController controller;
  final Icon? icon;
  final String? Function(String?)? validator;
  final bool? obscure;
  final EdgeInsets? margin;
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLenght;
  final bool? counterText;
  const LoginInput({super.key, required this.controller, required this.label,this.icon, this.validator, this.obscure, this.margin, this.inputFormatters, this.maxLenght, this.counterText});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        children: [
          Row(children: [const SizedBox(width: 8),Flexible(child: Text(widget.label,style: const TextStyle(color: Colors.white,fontSize: 16)))]),
          Container(
            padding: const EdgeInsets.all(4),
            child: TextFormField(
              inputFormatters: widget.inputFormatters,
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.obscure??false,
              maxLength: widget.maxLenght,
              decoration: InputDecoration(
                  filled: true,
                  counterText: widget.counterText??false?null:'',
                  prefixIcon: widget.icon,
                  fillColor: Colors.white,
                  errorStyle: const TextStyle(color: Colors.red),
                  border: const  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide.none
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
