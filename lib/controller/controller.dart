import 'package:mobx/mobx.dart';
import 'package:uberapp/models/register_model.dart';
part 'controller.g.dart';

class ControllerStore = _ControllerStoreBase with _$ControllerStore;

abstract class _ControllerStoreBase with Store {
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

        //método de cadastrar

      } else {
        errorMessage = 'fill in the email';
      }
    } else {
      errorMessage = 'fill in the name';
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
