import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uberapp/controller/controller.dart';
import 'package:uberapp/models/register_model.dart';

//Service: instancia métodos de conexão com Firebase
ControllerStore controller = ControllerStore();

class ClientService {
  final clientFirebase = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final personRef =
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromMap(snapshot.data()!),
            toFirestore: (user, _) => user.toMap(),
          );

  Future<void> registerUser(
      {required String email, required String password}) async {
    try {
      await clientFirebase
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((firebaseUser) {
        db.collection('users').doc(firebaseUser.user!.uid);
        // .set();
      });
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future<void> loginFirebase(
      {required String email, required String password}) async {
    try {
      await clientFirebase.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future<void> logOutFirebase() async {
    FirebaseAuth.instance.signOut();
  }
}
