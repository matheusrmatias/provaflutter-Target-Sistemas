import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova_flutter/src/auth/user_auth.dart';
import 'package:prova_flutter/src/screens/info_capture_page.dart';
import 'package:prova_flutter/src/themes/main_theme.dart';
import 'package:prova_flutter/src/widgets/link_button.dart';
import 'package:prova_flutter/src/widgets/login_button.dart';
import 'package:prova_flutter/src/widgets/login_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  bool hasError = false;
  String? error;

  bool inLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [MainTheme.oceanBlue, MainTheme.cyan])),
              child: Center(
                child: SingleChildScrollView(
                    child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginInput(
                        controller: user,
                        hintText: 'user@example.com',
                        label: 'Usuário',
                        icon: const Icon(Icons.person),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        maxLenght: 20,
                        validator: (value) {
                          if (value!.isEmpty) return 'O campo é obrigatório';
                          if (value[value.length - 1] == ' ') {
                            user.text = value.trim();
                            value = value.trim();
                          }
                          if (!RegExp(pattern).hasMatch(value)) {
                            return "Obrigatório um e-mail válido";
                          }
                          return null;
                        },
                      ),
                      LoginInput(
                        controller: password,
                        hintText: '123456',
                        label: 'Senha',
                        icon: const Icon(Icons.lock),
                        obscure: true,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        onSubmitted: (value) => _onSubmitted(),
                        maxLenght: 20,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[A-z0-9]'))
                        ],
                        validator: (value) {
                          if (value!.isEmpty) return 'O campo é obrigatório';
                          if (value.length < 2)
                            return 'O campo deve ter ao menos 2 caracteres';
                          return null;
                        },
                      ),
                      hasError
                          ? Text(
                              error ?? '',
                              style: const TextStyle(color: Colors.red),
                            )
                          : const SizedBox(),
                      inLogin? CircularProgressIndicator(color: MainTheme.green,):LoginButton(
                          onPressed: inLogin? null:_onSubmitted,
                          text: 'Entrar',
                          margin: const EdgeInsets.only(top: 32))
                    ],
                  ),
                )),
              )),
          const LinkButton(
            text: 'Política de Privacidade',
            url: 'https://www.google.com.br',
          )
        ],
      ),
    );
  }

  _onSubmitted() async {
    error = null;
    setState(() {
      hasError = false;
      inLogin = true;
    });
    UserAuth auth = UserAuth();

    if (_formKey.currentState!.validate()) {
      error = await auth.loadUser(user.text, password.text);
      if (error == null) {
        if (mounted) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return const InfoCapturePage();
          }));
        }
      } else {
        setState(() => hasError = true);
      }
    }
    setState(()=>inLogin = false);
  }
}
