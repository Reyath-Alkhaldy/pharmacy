// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicine {
  final String id;
  final String nameEn;
  final String nameAr;
  final String image;
  final double price;
  final String description;
    bool selected;
  Medicine({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.price,
    required this.description,
    this.selected = false,
  });

  Medicine copyWith({
    String? id,
    String? nameEn,
    String? nameAr,
    String? image,
    double? price,
    String? description,
    bool? selected,
  }) {
    return Medicine(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'image': image,
      'price': price,
      'description': description,
      'selected': selected,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'] as String,
      nameEn: map['nameEn'] as String,
      nameAr: map['nameAr'] as String,
      image: map['image'] as String,
      price: map['price'] as double,
      description: map['description'] as String,
      selected: map['selected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) =>
      Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicine(id: $id, nameEn: $nameEn, nameAr: $nameAr, image: $image, price: $price, description: $description, selected: $selected)';
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nameEn == nameEn &&
      other.nameAr == nameAr &&
      other.image == image &&
      other.price == price &&
      other.description == description &&
      other.selected == selected;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nameEn.hashCode ^
      nameAr.hashCode ^
      image.hashCode ^
      price.hashCode ^
      description.hashCode ^
      selected.hashCode;
  }
}
