import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:uberapp/models/register_model.dart';
import 'package:uberapp/services/database.dart';
import 'package:uberapp/services/maps.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uberapp/shared/utils/app_permissions.dart';
import 'package:uberapp/views/passenger_screen.dart';
part 'controller.g.dart';

class ControllerStore = _ControllerStoreBase with _$ControllerStore;

abstract class _ControllerStoreBase with Store {
  final clientService = ClientService();
  final userPosition = CheckPermission();

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String errorMessage = '';

  @observable
  String userId = '';

  @observable
  String userType = '';

  @observable
  String typeAddress = '';

  @observable
  bool userPassenger = false;

  @observable
  bool isDeniedForever = false;

  void setIsDeniedForever(bool value) => isDeniedForever = value;

  @observable
  Position? currentPosition;

  void setCurrentPosition(Position value) => currentPosition = value;

  @observable
  List<String> itensMenu = ['LogOut', 'Config'];

  @action
  void menuItem(String choice) {
    switch (choice) {
      case 'LogOut':
        logOutUser();
        //Navigator.pushReplacement(context, '/login');
        break;
    }
  }

  @action
  lastKnownLocation() async {
    Position? lastPosition = await Geolocator.getLastKnownPosition();
  }

//MAPS!!
  @action
  Future<void> getPosition() async {
    try {
      final result = await userPosition.getPosition();
      log(result.toString());

      setCurrentPosition(result);
      setIsDeniedForever(false);
    } catch (e) {
      log(e.toString());
      if (e.toString() == 'DENIED_FOREVER') {
        setIsDeniedForever(true);
      }
    }
  }

  //FIREBASE

  @action
  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      await clientService.registerUser(email: email, password: password);
    } catch (erro) {
      if (erro == 'email-already-in-use') {
        throw erro;
      } else {
        throw erro;
      }
    }
  }

  @action
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      await clientService.loginFirebase(email: email, password: password);
    } catch (erro) {
      if (erro == 'user-not-found') {
        throw erro;
      } else {
        throw erro;
      }
    }
  }

  @action
  Future<void> logOutUser() async {
    await clientService.logOutFirebase();
  }

  @action
  setName(String value) {
    name = value;
  }

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  setPassword(String value) {
    password = value;
  }

  @action
  setTypeAddress(String value) {
    typeAddress = value;
  }

  @action
  String verifiedUserType(userType) {
    return userType ? 'Driver' : 'Passenger';
  }

  @action
  void validateFields() {
    if (name.isNotEmpty) {
      if (email.isNotEmpty && email.contains('@')) {
        if (password.isNotEmpty && password.length > 6) {
        } else {
          errorMessage = 'fill in the password';
        }

        UserModel user = UserModel(
            userId: userId,
            name: name,
            email: email,
            password: password,
            userType: verifiedUserType(userType));
      } else {
        errorMessage = 'fill in the email';
      }
    } else {
      errorMessage = 'fill in the name';
    }
  }

  @action
  void validateFieldsLogin() {
    {
      if (email.isNotEmpty && email.contains('@')) {
        if (password.isNotEmpty && password.length > 6) {
        } else {
          errorMessage = 'fill in the password';
        }

        UserModel user = UserModel(
            userId: userId,
            name: name,
            email: email,
            password: password,
            userType: verifiedUserType(userType));
      } else {
        errorMessage = 'fill in the email';
      }
    }
  }

  @action
  Future<void> callUber() async {
    if (typeAddress.isNotEmpty) {}
  }

  // @action
  // Map<String, dynamic> toMap() {
  //   Map<String, dynamic> map = {
  //     'name': name,
  //     'email': email,
  //     'userType': userType,
  //   };
  //   return map;
  // }
}
