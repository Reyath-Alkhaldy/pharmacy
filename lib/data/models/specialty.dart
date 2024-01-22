// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Specialty extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  const Specialty({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  Specialty copyWith({
    int? id,
    String? name,
    String? imageUrl,
  }) {
    return Specialty(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image_url': imageUrl,
    };
  }

  factory Specialty.fromMap(Map<String, dynamic> map) {
    return Specialty(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Specialty.fromJson(String source) =>
      Specialty.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, imageUrl];
}

class SpecialtyPagination extends Equatable {
  final int currentPage;
  final int lastPage;
  final int from;
  final int to;
  final int perPage;
  final int total;
  final List<Specialty> specialties;
  const SpecialtyPagination({
    required this.currentPage,
    required this.lastPage,
    required this.from,
    required this.to,
    required this.perPage,
    required this.total,
    required this.specialties,
  });

  SpecialtyPagination copyWith({
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    int? perPage,
    int? total,
    List<Specialty>? specialties,
  }) {
    return SpecialtyPagination(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      specialties: specialties ?? this.specialties,
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
      'data': specialties.map((x) => x.toMap()).toList(),
    };
  }

  factory SpecialtyPagination.fromMap(Map<String, dynamic> map) {
    return SpecialtyPagination(
      currentPage: map['current_page'] as int,
      lastPage: map['last_page'] as int,
      from: map['from'] as int,
      to: map['to'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      specialties: List<Specialty>.from((map['data']  ).map<Specialty>((x) => Specialty.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialtyPagination.fromJson(String source) => SpecialtyPagination.fromMap(json.decode(source) as Map<String, dynamic>);

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
      specialties,
    ];
  }
}
