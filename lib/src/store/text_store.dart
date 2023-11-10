import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'text_store.g.dart';

class TextStore = _TextStore with _$TextStore;

abstract class _TextStore with Store{

  _TextStore(){
    loadText();
  }

  @observable
  ObservableList<String> textList = ObservableList<String>();

  @action
  void addText(String value){
    textList.add(value);
    saveText();
  }

  @action
  void removeText(int index){
    textList.removeAt(index);
    saveText();
  }

  @action
  void editText(String value,int index){
    textList[index] = value;
    saveText();
  }

  saveText(){
    SharedPreferences.getInstance().then((instance){
      instance.setStringList('textList', textList);
    });
  }

  @action
  Future<void> loadText()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var element in prefs.getStringList('textList')!) {
      textList.add(element);
    }
  }

}