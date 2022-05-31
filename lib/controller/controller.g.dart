// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerStore on _ControllerStoreBase, Store {
  late final _$nameAtom =
      Atom(name: '_ControllerStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_ControllerStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_ControllerStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ControllerStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$userIdAtom =
      Atom(name: '_ControllerStoreBase.userId', context: context);

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$userTypeAtom =
      Atom(name: '_ControllerStoreBase.userType', context: context);

  @override
  String get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(String value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  late final _$typeAddressAtom =
      Atom(name: '_ControllerStoreBase.typeAddress', context: context);

  @override
  String get typeAddress {
    _$typeAddressAtom.reportRead();
    return super.typeAddress;
  }

  @override
  set typeAddress(String value) {
    _$typeAddressAtom.reportWrite(value, super.typeAddress, () {
      super.typeAddress = value;
    });
  }

  late final _$userPassengerAtom =
      Atom(name: '_ControllerStoreBase.userPassenger', context: context);

  @override
  bool get userPassenger {
    _$userPassengerAtom.reportRead();
    return super.userPassenger;
  }

  @override
  set userPassenger(bool value) {
    _$userPassengerAtom.reportWrite(value, super.userPassenger, () {
      super.userPassenger = value;
    });
  }

  late final _$isDeniedForeverAtom =
      Atom(name: '_ControllerStoreBase.isDeniedForever', context: context);

  @override
  bool get isDeniedForever {
    _$isDeniedForeverAtom.reportRead();
    return super.isDeniedForever;
  }

  @override
  set isDeniedForever(bool value) {
    _$isDeniedForeverAtom.reportWrite(value, super.isDeniedForever, () {
      super.isDeniedForever = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: '_ControllerStoreBase.currentPosition', context: context);

  @override
  Position? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$itensMenuAtom =
      Atom(name: '_ControllerStoreBase.itensMenu', context: context);

  @override
  List<String> get itensMenu {
    _$itensMenuAtom.reportRead();
    return super.itensMenu;
  }

  @override
  set itensMenu(List<String> value) {
    _$itensMenuAtom.reportWrite(value, super.itensMenu, () {
      super.itensMenu = value;
    });
  }

  late final _$lastKnownLocationAsyncAction =
      AsyncAction('_ControllerStoreBase.lastKnownLocation', context: context);

  @override
  Future lastKnownLocation() {
    return _$lastKnownLocationAsyncAction.run(() => super.lastKnownLocation());
  }

  late final _$getPositionAsyncAction =
      AsyncAction('_ControllerStoreBase.getPosition', context: context);

  @override
  Future<void> getPosition() {
    return _$getPositionAsyncAction.run(() => super.getPosition());
  }

  late final _$createUserAsyncAction =
      AsyncAction('_ControllerStoreBase.createUser', context: context);

  @override
  Future<void> createUser({required String email, required String password}) {
    return _$createUserAsyncAction
        .run(() => super.createUser(email: email, password: password));
  }

  late final _$loginUserAsyncAction =
      AsyncAction('_ControllerStoreBase.loginUser', context: context);

  @override
  Future<void> loginUser({required String email, required String password}) {
    return _$loginUserAsyncAction
        .run(() => super.loginUser(email: email, password: password));
  }

  late final _$logOutUserAsyncAction =
      AsyncAction('_ControllerStoreBase.logOutUser', context: context);

  @override
  Future<void> logOutUser() {
    return _$logOutUserAsyncAction.run(() => super.logOutUser());
  }

  late final _$_ControllerStoreBaseActionController =
      ActionController(name: '_ControllerStoreBase', context: context);

  @override
  void menuItem(String choice) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.menuItem');
    try {
      return super.menuItem(choice);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTypeAddress(String value) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.setTypeAddress');
    try {
      return super.setTypeAddress(value);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String verifiedUserType(dynamic userType) {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.verifiedUserType');
    try {
      return super.verifiedUserType(userType);
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFields() {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.validateFields');
    try {
      return super.validateFields();
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFieldsLogin() {
    final _$actionInfo = _$_ControllerStoreBaseActionController.startAction(
        name: '_ControllerStoreBase.validateFieldsLogin');
    try {
      return super.validateFieldsLogin();
    } finally {
      _$_ControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
errorMessage: ${errorMessage},
userId: ${userId},
userType: ${userType},
typeAddress: ${typeAddress},
userPassenger: ${userPassenger},
isDeniedForever: ${isDeniedForever},
currentPosition: ${currentPosition},
itensMenu: ${itensMenu}
    ''';
  }
}
