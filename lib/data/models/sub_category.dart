// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubCategory {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final int mainCategoryId;
  SubCategory({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.mainCategoryId,
  });

  SubCategory copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? image,
    int? mainCategoryId,
  }) {
    return SubCategory(
      id: id?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
      mainCategoryId: mainCategoryId ?? this.mainCategoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'main_category_id': mainCategoryId,
    };
  }

  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      id: map['id'] as int,
      nameEn: map['name_en'] as String,
      nameAr: map['name_ar'] as String,
      image: map['image'] as String,
      mainCategoryId: map['main_category_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategory.fromJson(String source) =>
      SubCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubCategory(id: $id, nameEn: $nameEn, nameAr: $nameAr, image: $image, mainCategoryId: $mainCategoryId)';
  }

  @override
  bool operator ==(covariant SubCategory other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nameEn == nameEn &&
        other.nameAr == nameAr &&
        other.image == image &&
        other.mainCategoryId == mainCategoryId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nameEn.hashCode ^
        nameAr.hashCode ^
        image.hashCode ^
        mainCategoryId.hashCode;
  }
}
