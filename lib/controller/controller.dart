import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:uberapp/models/register_model.dart';
import 'package:uberapp/services/database.dart';
import 'package:uberapp/services/maps.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uberapp/views/passenger_screen.dart';
part 'controller.g.dart';

class ControllerStore = _ControllerStoreBase with _$ControllerStore;

abstract class _ControllerStoreBase with Store {
  final clientService = ClientService();

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
  bool userPassenger = false;

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
  void onMapCreated(GoogleMapController controller) {
    GoogleMaps().controllerMaps.complete(controller);
  }

  @action
  lastKnownLocation() async {
    Position? lastPosition = await Geolocator.getLastKnownPosition();
  }

  @action
  currentPosition() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

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

        User user = User(
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

        User user = User(
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
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'userType': userType,
    };
    return map;
  }
}
