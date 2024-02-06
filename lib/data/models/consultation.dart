// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'doctor.dart';

class ConsultationPagination extends Equatable {
  final int currentPage;
  final int lastPage;
  final int from;
  final int to;
  final int perPage;
  final int total;
  final List<Consultation> consultations;
  const ConsultationPagination({
    required this.currentPage,
    required this.lastPage,
    required this.from,
    required this.to,
    required this.perPage,
    required this.total,
    required this.consultations,
  });

  ConsultationPagination copyWith({
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    int? perPage,
    int? total,
    List<Consultation>? consultations,
  }) {
    return ConsultationPagination(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      consultations: consultations ?? this.consultations,
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
      'data': consultations.map((x) => x.toMap()).toList(),
    };
  }

  factory ConsultationPagination.fromMap(Map<String, dynamic> map) {
    return ConsultationPagination(
      currentPage: map['current_page'] as int,
      lastPage: map['last_page'] as int,
      from: map['from'] as int,
      to: map['to'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      consultations: List<Consultation>.from(
        (map['data']).map<Consultation>(
          (x) => Consultation.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConsultationPagination.fromJson(String source) =>
      ConsultationPagination.fromMap(
          json.decode(source) as Map<String, dynamic>);

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
      consultations,
    ];
  }
}

class Consultation extends Equatable {
  final int id;
  final String text;
  final String imageUrl;
  final String type;
  final String createdAt;
  final int userId;
  final int doctorId;
  final Doctor doctor;
  const Consultation({
    required this.id,
    required this.text,
    required this.imageUrl,
    required this.type,
    required this.createdAt,
    required this.userId,
    required this.doctorId,
    required this.doctor,
  });

  Consultation copyWith({
    int? id,
    String? text,
    String? imageUrl,
    String? type,
    String? createdAt,
    int? userId,
    int? doctorId,
    Doctor? doctor,
  }) {
    return Consultation(
      id: id ?? this.id,
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      doctorId: doctorId ?? this.doctorId,
      doctor: doctor ?? this.doctor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'image_url': imageUrl,
      'type': type,
      'created_at': createdAt,
      'user_id': userId,
      'doctor_id': doctorId,
      'doctor': doctor.toMap(),
    };
  }

  factory Consultation.fromMap(Map<String, dynamic> map) {
    return Consultation(
      id: map['id'] as int,
      text: map['text'] as String,
      imageUrl: map['image_url'] as String,
      type: map['type'] as String,
      createdAt: map['created_at'] as String,
      userId: map['user_id'] as int,
      doctorId: map['doctor_id'] as int,
      doctor: Doctor.fromMap(map['doctor'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Consultation.fromJson(String source) => Consultation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      text,
      imageUrl,
      type,
      createdAt,
      userId,
      doctorId,
      doctor,
    ];
  }
}
