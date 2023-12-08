// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Doctor {
  final String id;
  final String name;
  final String image;
  final String specialty;
  final String hospital;
  final String phone;
  final String email;
  final String cv;
  Doctor({
    required this.id,
    required this.name,
    required this.image,
    required this.specialty,
    required this.hospital,
    required this.phone,
    required this.email,
    required this.cv,
  });

  Doctor copyWith({
    String? id,
    String? name,
    String? image,
    String? specialty,
    String? hospital,
    String? phone,
    String? email,
    String? cv,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      specialty: specialty ?? this.specialty,
      hospital: hospital ?? this.hospital,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      cv: cv ?? this.cv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'specialty': specialty,
      'hospital': hospital,
      'phone': phone,
      'email': email,
      'cv': cv,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      specialty: map['specialty'] as String,
      hospital: map['hospital'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      cv: map['cv'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name, image: $image, specialty: $specialty, hospital: $hospital, phone: $phone, email: $email, cv: $cv)';
  }

  @override
  bool operator ==(covariant Doctor other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image &&
      other.specialty == specialty &&
      other.hospital == hospital &&
      other.phone == phone &&
      other.email == email &&
      other.cv == cv;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      image.hashCode ^
      specialty.hashCode ^
      hospital.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      cv.hashCode;
  }
}
