// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Pharmacy {
  final String id;
  final String name;
  final String password;
  final String logUrl;
  final String address;
  final List<String>? phoneNumbers;
  final List<String> location;
  final int numberOfViewDays;
  Pharmacy({
    required this.id,
    required this.name,
    required this.password,
    required this.logUrl,
    required this.address,
    this.phoneNumbers,
    required this.location,
    required this.numberOfViewDays,
  });

  Pharmacy copyWith({
    String? id,
    String? name,
    String? password,
    String? logUrl,
    String? address,
    List<String>? phoneNumbers,
    List<String>? location,
    int? numberOfViewDays,
  }) {
    return Pharmacy(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      logUrl: logUrl ?? this.logUrl,
      address: address ?? this.address,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      location: location ?? this.location,
      numberOfViewDays: numberOfViewDays ?? this.numberOfViewDays,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'logUrl': logUrl,
      'address': address,
      'phoneNumbers': phoneNumbers,
      'location': location,
      'numberOfViewDays': numberOfViewDays,
    };
  }

  factory Pharmacy.fromMap(Map<String, dynamic> map) {
    return Pharmacy(
      id: map['id'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      logUrl: map['logUrl'] as String,
      address: map['address'] as String,
      phoneNumbers: map['phoneNumbers'] != null
          ? List<String>.from((map['phoneNumbers'] as List<String>))
          : null,
      location: List<String>.from((map['location'] as List<String>)),
      numberOfViewDays: map['numberOfViewDays'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pharmacy.fromJson(String source) =>
      Pharmacy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pharmacy(id: $id, name: $name, password: $password, logUrl: $logUrl, address: $address, phoneNumbers: $phoneNumbers, location: $location, numberOfViewDays: $numberOfViewDays)';
  }

  @override
  bool operator ==(covariant Pharmacy other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.password == password &&
        other.logUrl == logUrl &&
        other.address == address &&
        listEquals(other.phoneNumbers, phoneNumbers) &&
        listEquals(other.location, location) &&
        other.numberOfViewDays == numberOfViewDays;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        password.hashCode ^
        logUrl.hashCode ^
        address.hashCode ^
        phoneNumbers.hashCode ^
        location.hashCode ^
        numberOfViewDays.hashCode;
  }
}
