import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uberapp/controller/controller.dart';
import 'package:uberapp/views/register_screen.dart';

ControllerStore controller = ControllerStore();

final clientFirebase = FirebaseAuth.instance;

Future<void> registerUser(
    {required String email, required String password}) async {
  final user = await clientFirebase.createUserWithEmailAndPassword(
      email: controller.email, password: controller.password);
}
