import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> loadUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      debugPrint('Error: ${e.code}');
      switch (e.code) {
        case "invalid-email":
          return "E-mail inválido";
        case "INVALID_LOGIN_CREDENTIALS":
          return "Credenciais Inválidas";
        case "network-request-failed":
          return "Erro de conexão";
        default:
          return "Ocorreu um erro";
      }
    }
  }

  String getUserUid() {
    return auth.currentUser?.uid ?? 'noUser';
  }

  String getUserEmail() {
    return auth.currentUser!.email ?? 'noUserEmailAvailable';
  }

  Future<void> signOutUser() async {
    await auth.signOut();
  }
}
