// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicine {
  final String id;
  final String nameEn;
  final String nameAr;
  final String image;
  final String description;
  Medicine({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.description,
  });
  
  
 

  Medicine copyWith({
    String? id,
    String? nameEn,
    String? nameAr,
    String? image,
    String? description,
  }) {
    return Medicine(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'image': image,
      'description': description,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'] as String,
      nameEn: map['nameEn'] as String,
      nameAr: map['nameAr'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) => Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicine(id: $id, nameEn: $nameEn, nameAr: $nameAr, image: $image, description: $description)';
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nameEn == nameEn &&
      other.nameAr == nameAr &&
      other.image == image &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nameEn.hashCode ^
      nameAr.hashCode ^
      image.hashCode ^
      description.hashCode;
  }
}
