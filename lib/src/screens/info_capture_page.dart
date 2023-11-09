import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8))
                            ),
                            constraints: const BoxConstraints(
                              maxHeight: 300
                            ),
                            child: Observer(
                              builder: (_){
                                if(infoStore.textList.isEmpty)return const Center(child: Text('Nenhum texto registrado.',textAlign: TextAlign.center),);
                                return ListView.builder(
                                    itemCount: infoStore.textList.length,
                                    itemBuilder: (_,index)=>TextCard(text: infoStore.textList[index], index: index,store: infoStore,)
                                );
                              },
                            )
                          ),
                          TextInfoInput(
                              controller: input,
                              hintText: 'Digite seu Texto',
                              margin: const EdgeInsets.only(top: 32),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'O campo tem que ser preenchido';
                                }
                              },
                              onFieldSubmitted: _onSubmited
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

  _onSubmited(String value){
    if(_formKey.currentState!.validate()){
      infoStore.addText(value);
      input.clear();
    }
  }
}
