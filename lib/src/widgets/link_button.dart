import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final String url;
  const LinkButton({super.key, required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ()=>launchUrlString(url),
        child: Text(text, style: const TextStyle(color: Colors.white))
    );
  }
}
