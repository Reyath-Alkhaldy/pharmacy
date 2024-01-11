// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MedicalSpecialty extends Equatable {
  final int id;
  final String name;
  final String image;
  const MedicalSpecialty({
    required this.id,
    required this.name,
    required this.image,
  });
  

  MedicalSpecialty copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return MedicalSpecialty(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory MedicalSpecialty.fromMap(Map<String, dynamic> map) {
    return MedicalSpecialty(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalSpecialty.fromJson(String source) => MedicalSpecialty.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, image];
}
