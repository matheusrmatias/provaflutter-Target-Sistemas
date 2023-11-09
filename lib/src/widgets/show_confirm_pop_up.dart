import 'package:flutter/material.dart';

void showConfirmPopUp(BuildContext context, String text, void Function()? confirmAction){
  showDialog(context: context,builder: (BuildContext context){
    return Dialog(
      child:  Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(text,style: const TextStyle(fontSize: 18),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: ()=>Navigator.pop(context), child:  const Text('Não',style: TextStyle(color: Colors.black))),
                  TextButton(onPressed: (){confirmAction!();Navigator.pop(context);}, child: const Text('Sim',style: TextStyle(color: Colors.black)))
                ],
              )
            ],
          ),
        )
      )
    );
  });
}