// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserResponse extends Equatable {
  final String status;
  final String token;
  final User user;
  const UserResponse({
    required this.status,
    required this.token,
    required this.user,
  });

  UserResponse copyWith({
    String? status,
    String? token,
    User? user,
  }) {
    return UserResponse(
      status: status ?? this.status,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'token': token,
      'user': user.toMap(),
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      status: map['status'] as String,
      token: map['token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, token, user];
}

class User extends Equatable {
  final int id;
  final String name;
  final String? email;
  final String? adrress;
  final String imageUrl;
  final String phoneNumber;
  const User({
    required this.id,
    required this.name,
    this.email,
    this.adrress,
    required this.imageUrl,
    required this.phoneNumber,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? adrress,
    String? imageUrl,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      adrress: adrress ?? this.adrress,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'adrress': adrress,
      'image_url': imageUrl,
      'phone_number': phoneNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] != null ? map['email'] as String : '',
      adrress: map['adrress'] != null ? map['adrress'] as String : "",
      imageUrl: map['image_url'] as String,
      phoneNumber: map['phone_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      email!,
      adrress!,
      imageUrl,
      phoneNumber,
    ];
  }
}
