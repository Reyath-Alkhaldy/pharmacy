// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

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
      userType: int.parse(map['user_type'].toString()),
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, token, userType, user];
}

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String imageUrl;
  final int phoneNumber;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phoneNumber,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? imageUrl,
    int? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'image_url': imageUrl,
      'phone_number': phoneNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      imageUrl: map['image_url'] as String,
      phoneNumber: int.parse(map['phone_number'].toString()),
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
      email,
      imageUrl,
      phoneNumber,
    ];
  }
}
