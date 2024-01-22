// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  final int id;
  final String name;
  final String email;
  final String imageUrl;
  final int specialtyId;
  const Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.specialtyId,
  });

  Doctor copyWith({
    int? id,
    String? name,
    String? email,
    String? imageUrl,
    int? specialtyId,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      specialtyId: specialtyId ?? this.specialtyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'image_url': imageUrl,
      'specialty_id': specialtyId,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      imageUrl: map['image_url'] as String,
      specialtyId: map['specialty_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) =>
      Doctor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      imageUrl,
      specialtyId,
    ];
  }
}

class DoctorPagination extends Equatable {
  final int currentPage;
  final int lastPage;
  final int from;
  final int to;
  final int perPage;
  final int total;
  final List<Doctor> doctors;
  const DoctorPagination({
    required this.currentPage,
    required this.lastPage,
    required this.from,
    required this.to,
    required this.perPage,
    required this.total,
    required this.doctors,
  });

  DoctorPagination copyWith({
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    int? perPage,
    int? total,
    List<Doctor>? specialties,
  }) {
    return DoctorPagination(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      doctors: specialties ?? this.doctors,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'last_page': lastPage,
      'from': from,
      'to': to,
      'per_page': perPage,
      'total': total,
      'data': doctors.map((x) => x.toMap()).toList(),
    };
  }

  factory DoctorPagination.fromMap(Map<String, dynamic> map) {
    return DoctorPagination(
      currentPage: map['current_page'] as int,
      lastPage: map['last_page'] as int,
      from: map['from'] as int,
      to: map['to'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      doctors: List<Doctor>.from(
        (map['data'])
            .map<Doctor>((x) => Doctor.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorPagination.fromJson(String source) =>
      DoctorPagination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      currentPage,
      lastPage,
      from,
      to,
      perPage,
      total,
      doctors,
    ];
  }
}
