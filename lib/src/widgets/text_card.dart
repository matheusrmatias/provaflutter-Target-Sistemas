import 'package:flutter/material.dart';
import 'package:prova_flutter/src/store/text_store.dart';
import 'package:prova_flutter/src/widgets/show_confirm_pop_up.dart';
import 'package:prova_flutter/src/widgets/text_info_input.dart';

class TextCard extends StatefulWidget {
  final String text;
  final int index;
  final TextStore store;
  const TextCard({super.key, required this.text, required this.index, required this.store});

  @override
  State<TextCard> createState() => _TextCardState();
}

class _TextCardState extends State<TextCard> {
  bool inEdit = false;
  final input = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black))
      ),
      child: Form(
        key: _formKey,
        child: Row(
          children: [

            Expanded(
              child: inEdit?
              TextInfoInput(
                  controller: input,
                  hintText: 'Digite seu Texto',
                  focusNode: focusNode,
                  onFieldSubmitted: (value)=>_onSubmited(),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'O campo tem que ser preenchido';
                    }
                  },
              ):
              Text(
                  widget.text,
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),

            inEdit?
            IconButton(
                onPressed: _onSubmited,
                icon: const Icon(Icons.check)
            ):
            IconButton(
                onPressed: (){
                  input.text = widget.text;
                  focusNode.requestFocus();
                  setState(()=>inEdit=true);
                },
                icon: const Icon(Icons.edit)
            ),

            inEdit?
            IconButton(
                onPressed: ()=>setState(()=>inEdit=false),
                icon: const Icon(Icons.close)
            ):
            IconButton(
              onPressed: (){
                showConfirmPopUp(context, 'Deseja mesmo excluir?', () {
                  widget.store.removeText(widget.index);
                });
              },
              icon: const Icon(Icons.close),
              style: IconButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(178, 67, 62,1.0),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(0, 0),
                  padding: const EdgeInsets.all(4)
              ),
            )
          ],
        ),
      )
    );
  }
  _onSubmited(){
    if(_formKey.currentState!.validate()){
      widget.store.editText(input.text,widget.index);
      setState(()=>inEdit=false);
    }
  }
}
