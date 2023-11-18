import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/src/screens/login_page.dart';
import 'package:prova_flutter/src/store/text_store.dart';
import 'package:prova_flutter/src/themes/main_theme.dart';
import 'package:prova_flutter/src/widgets/text_card.dart';
import 'package:prova_flutter/src/widgets/text_info_input.dart';
import '../widgets/link_button.dart';

class InfoCapturePage extends StatefulWidget {
  const InfoCapturePage({super.key});

  @override
  State<InfoCapturePage> createState() => _InfoCapturePageState();
}

class _InfoCapturePageState extends State<InfoCapturePage> {
  final _formKey = GlobalKey<FormState>();
  final infoStore = TextStore();
  final input = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [MainTheme.oceanBlue, MainTheme.cyan])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(children: [
            const Icon(Icons.account_circle, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              infoStore.auth.getUserEmail(),
              style: const TextStyle(color: Colors.white),
            )
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  infoStore.auth.signOutUser();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const LoginPage();
                  }));
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ))
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Center(
                  child: SingleChildScrollView(
                      child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            constraints: const BoxConstraints(maxHeight: 300),
                            child: Observer(
                              builder: (_) {
                                if (infoStore.textList.isEmpty)
                                  return const Center(
                                      child: Text('Nenhum texto registrado.',
                                          textAlign: TextAlign.center));
                                return ListView.builder(
                                    itemCount: infoStore.textList.length,
                                    itemBuilder: (_, index) {
                                      int reverseIndex =
                                          (infoStore.textList.length - 1) -
                                              index;
                                      return TextCard(
                                          text:
                                              infoStore.textList[reverseIndex],
                                          index: reverseIndex,
                                          store: infoStore);
                                    });
                              },
                            )),
                        TextInfoInput(
                            controller: input,
                            hintText: 'Digite seu Texto',
                            margin: const EdgeInsets.only(top: 32),
                            focusNode: focusNode,
                            autoFocus: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'O campo tem que ser preenchido';
                              }
                            },
                            onFieldSubmitted: _onSubmited)
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
      ),
    );
  }

  _onSubmited(String value) {
    if (_formKey.currentState!.validate()) {
      infoStore.addText(value);
      input.clear();
      focusNode.requestFocus();
    }
  }
}
