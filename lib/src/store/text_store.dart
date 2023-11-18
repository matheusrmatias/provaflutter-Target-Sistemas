import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/src/auth/user_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'text_store.g.dart';

class TextStore = _TextStore with _$TextStore;

abstract class _TextStore with Store {
  final UserAuth auth = UserAuth();

  _TextStore() {
    loadText();
  }

  @observable
  ObservableList<String> textList = ObservableList<String>();

  @action
  void addText(String value) {
    textList.add(value);
    saveText();
  }

  @action
  void removeText(int index) {
    textList.removeAt(index);
    saveText();
  }

  @action
  void editText(String value, int index) {
    textList[index] = value;
    saveText();
  }

  saveText() {
    SharedPreferences.getInstance().then((instance){
      String uid = auth.getUserUid();
      instance.setStringList(uid, textList);
    });
  }

  @action
  Future<void> loadText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uid = auth.getUserUid();

    for (var element in prefs.getStringList(uid)!) {
      textList.add(element);
    }
  }
}
