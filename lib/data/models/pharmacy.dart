// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Doctor {
  final int id;
  final String name;
  final String password;
  final String image;
  final String address;
  final String phoneNumber;
  final String status;
  final int numberOfViewDays;
  Doctor({
    required this.id,
    required this.name,
    required this.password,
    required this.image,
    required this.address,
    required this.phoneNumber,
    required this.status,
    required this.numberOfViewDays,
  });

  Doctor copyWith({
    int? id,
    String? name,
    String? password,
    String? image,
    String? address,
    String? phoneNumber,
    String? status,
    int? numberOfViewDays,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      image: image ?? this.image,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      numberOfViewDays: numberOfViewDays ?? this.numberOfViewDays,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'password': password,
      'image': image,
      'address': address,
      'phone_number': phoneNumber,
      'status': status,
      'number_of_view_days': numberOfViewDays,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'] as int,
      name: map['name'] as String,
      password: map['password'] as String,
      image: map['image'] as String,
      address: map['address'] as String,
      phoneNumber: map['phone_number'] as String,
      status: map['status'] as String,
      numberOfViewDays: map['number_of_view_days'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) =>
      Doctor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pharmacy(id: $id, name: $name, password: $password, image: $image, address: $address, phoneNumber: $phoneNumber, status: $status, numberOfViewDays: $numberOfViewDays)';
  }

  @override
  bool operator ==(covariant Doctor other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.password == password &&
        other.image == image &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.status == status &&
        other.numberOfViewDays == numberOfViewDays;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        password.hashCode ^
        image.hashCode ^
        address.hashCode ^
        phoneNumber.hashCode ^
        status.hashCode ^
        numberOfViewDays.hashCode;
  }

  toLowerCase() {}
}

class ResponseRequestPharmacy {
  final List<Doctor> pharmacies;
  ResponseRequestPharmacy({
    required this.pharmacies,
  });

  ResponseRequestPharmacy copyWith({
    List<Doctor>? pharmacies,
  }) {
    return ResponseRequestPharmacy(
      pharmacies: pharmacies ?? this.pharmacies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pharmacies': pharmacies.map((x) => x.toMap()).toList(),
    };
  }

  factory ResponseRequestPharmacy.fromMap(Map<String, dynamic> map) {
    return ResponseRequestPharmacy(
      pharmacies: List<Doctor>.from(
        (map['pharmacies']).map<Doctor>(
          (x) => Doctor.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseRequestPharmacy.fromJson(String source) =>
      ResponseRequestPharmacy.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResponseRequestPharmacy(pharmacies: $pharmacies)';

  @override
  bool operator ==(covariant ResponseRequestPharmacy other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.pharmacies, pharmacies);
  }

  @override
  int get hashCode => pharmacies.hashCode;
}
