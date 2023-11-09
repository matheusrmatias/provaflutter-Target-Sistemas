import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      colors: [
                        MainTheme.oceanBlue,
                        MainTheme.cyan
                      ]
                  )
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        LoginInput(
                          controller: user,
                          label: 'Usuário',
                          icon: const Icon(Icons.person),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          maxLenght: 20,
                          validator: (value){
                            if(value!.isEmpty)return 'O campo é obrigatório';
                            if(value[value.length-1]==' '){
                              user.text = value.trim();
                              value = value.trim();
                            }
                            return null;
                          },
                        ),
                        LoginInput(
                          controller: password,
                          label:  'Senha',
                          icon: const Icon(Icons.lock),
                          obscure: true,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          maxLenght: 20,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[A-z0-9]'))
                          ],
                          validator: (value){
                            if(value!.isEmpty)return 'O campo é obrigatório';
                            if(value.length<2)return 'O campo deve ter ao menos 2 caracteres';
                            return null;
                          },
                        ),
                        LoginButton(
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                                  return const InfoCapturePage();
                                }));
                              }
                            },
                            text: 'Entrar',
                            margin: const EdgeInsets.only(top: 32)
                        )
                      ],
                    ),
                  )
                ),
              )
          ),
          const LinkButton(text: 'Política de Privacidade',url: 'https://www.google.com.br',)
        ],
      ),
    );
  }
}
