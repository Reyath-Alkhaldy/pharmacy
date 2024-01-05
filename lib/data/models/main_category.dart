// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:new_maps/data/models/sub_category.dart';

class MainCategory {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final List<SubCategory>? subCategories;
  MainCategory({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    this.subCategories,
  });

  MainCategory copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? image,
    int? pharmacyId,
    List<SubCategory>? subCategories,
  }) {
    return MainCategory(
      id: id?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      image: image ?? this.image,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id':id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image': image,
      // if(subCategories!.isNotEmpty)
      'sub_categories': subCategories!.map((x) => x.toMap()).toList(),
    };
  }

  factory MainCategory.fromMap(Map<String, dynamic> map) {
    return MainCategory(
      id: map['id'] as int,
      nameEn: map['name_en'] as String,
      nameAr: map['name_ar'] as String,
      image: map['image'] as String,
    subCategories: map['sub_categories'] != null ? List<SubCategory>.from((map['sub_categories']  ).map<SubCategory?>((x) => SubCategory.fromMap(x as Map<String,dynamic>),),) :  null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainCategory.fromJson(String source) => MainCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainCategory(id: $id, nameEn: $nameEn, nameAr: $nameAr, image: $image,  subCategories: $subCategories)';
  }

  @override
  bool operator ==(covariant MainCategory other) {
    if (identical(this, other)) return true;
  
    return 
    other.id == id &&
      other.nameEn == nameEn &&
      other.nameAr == nameAr &&
      other.image == image &&
      listEquals(other.subCategories, subCategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^ nameEn.hashCode ^
      nameAr.hashCode ^
      image.hashCode ^
      subCategories.hashCode;
  }
}
