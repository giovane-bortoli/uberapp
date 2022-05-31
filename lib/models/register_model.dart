// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String userId;
  String name;
  String email;
  String password;
  String userType;
  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'userType': userType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userType: map['userType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
