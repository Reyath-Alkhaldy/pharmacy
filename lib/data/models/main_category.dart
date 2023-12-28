// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:new_maps/data/models/sub_category.dart';

class MainCategory {
  final String nameEn;
  final String nameAr;
  final String image;
  final int pharmacyId;
  final List<SubCategory>? subCategories;
  MainCategory({
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.pharmacyId,
    this.subCategories,
  });

  MainCategory copyWith({
    String? nameEn,
    String? nameAr,
    String? image,
    int? pharmacyId,
    List<SubCategory>? subCategories,
  }) {
    return MainCategory(
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      'pharmacy_id': pharmacyId,
      // if(subCategories!.isNotEmpty)
      'sub_categories': subCategories!.map((x) => x.toMap()).toList(),
    };
  }

  factory MainCategory.fromMap(Map<String, dynamic> map) {
    return MainCategory(
      nameEn: map['name_en'] as String,
      nameAr: map['name_ar'] as String,
      image: map['image'] as String,
      pharmacyId: map['pharmacy_id'] as int,
    subCategories: map['sub_categories'] != null ? List<SubCategory>.from((map['sub_categories']  ).map<SubCategory?>((x) => SubCategory.fromMap(x as Map<String,dynamic>),),) :  null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainCategory.fromJson(String source) => MainCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainCategory(nameEn: $nameEn, nameAr: $nameAr, image: $image, pharmacyId: $pharmacyId, subCategories: $subCategories)';
  }

  @override
  bool operator ==(covariant MainCategory other) {
    if (identical(this, other)) return true;
  
    return 
      other.nameEn == nameEn &&
      other.nameAr == nameAr &&
      other.image == image &&
      other.pharmacyId == pharmacyId &&
      listEquals(other.subCategories, subCategories);
  }

  @override
  int get hashCode {
    return nameEn.hashCode ^
      nameAr.hashCode ^
      image.hashCode ^
      pharmacyId.hashCode ^
      subCategories.hashCode;
  }
}
