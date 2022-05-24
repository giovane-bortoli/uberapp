import 'package:firebase_auth/firebase_auth.dart';

//Service: instancia métodos de conexão com Firebase

class ClientService {
  final clientFirebase = FirebaseAuth.instance;

  Future<void> registerUser(
      {required String email, required String password}) async {
    try {
      await clientFirebase.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

//método de login
}
