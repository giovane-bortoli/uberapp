import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uberapp/controller/controller.dart';

//Service: instancia métodos de conexão com Firebase

class ClientService {
  // ControllerStore controller = ControllerStore();
  final clientFirebase = FirebaseAuth.instance;
  //final db = FirebaseFirestore.instance;

  Future<void> registerUser(
      {required String email, required String password}) async {
    try {
      await clientFirebase.createUserWithEmailAndPassword(
          email: email, password: password);
      //     .then((firebaseUser) {
      //   db
      //       .collection('users')
      //       .doc(firebaseUser.user!.uid)
      //       .set(controller.toMap());
      // });
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

//salvar no db
  //     .then((firebaseUser) {
      //   db
      //       .collection('users')
      //       .doc(firebaseUser.user!.uid)
      //       .set(controller.toMap());
      // });