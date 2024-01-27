// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

var map = {
  "status": "success",
  "token": "1|q5uob4T9nJvsCJ8DwrtgW9CJdlTQ8BcP2GfaLLHtae5c0348",
  "user": {
    "name": "riyad",
    "email": "riadalkhaldy771@gmail.com",
    "phone_number": "5658555545",
    "id": 12
  },
  "user_type": "1"
};

class UserResponse extends Equatable {
  final String status;
  final String token;
  final int userType;
  final User user;
  const UserResponse({
    required this.status,
    required this.token,
    required this.userType,
    required this.user,
  });

  UserResponse copyWith({
    String? status,
    String? token,
    int? userType,
    User? user,
  }) {
    return UserResponse(
      status: status ?? this.status,
      token: token ?? this.token,
      userType: userType ?? this.userType,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'token': token,
      'user_type': userType,
      'user': user.toMap(),
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      status: map['status'] as String,
      token: map['token'] as String,
      userType: map['user_type'] as int,
      user: User.fromMap(map['user'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) => UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, token, userType, user];
}

 
class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final int phoneNumber;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    int? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, email, phoneNumber];
}
