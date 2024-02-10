// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MedicinesResponse extends Equatable {
  final String status;
  final List<Medicine> medicines;
  const MedicinesResponse({
    required this.status,
    required this.medicines,
  });

  MedicinesResponse copyWith({
    String? status,
    List<Medicine>? medicines,
  }) {
    return MedicinesResponse(
      status: status ?? this.status,
      medicines: medicines ?? this.medicines,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'medicines': medicines.map((x) => x.toMap()).toList(),
    };
  }

  factory MedicinesResponse.fromMap(Map<String, dynamic> map) {
    return MedicinesResponse(
      status: map['status'] as String,
      medicines: List<Medicine>.from(
        (map['medicines']).map<Medicine>(
          (x) => Medicine.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicinesResponse.fromJson(String source) =>
      MedicinesResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, medicines];
}
//!
//

class Medicine extends Equatable {
  final int id;
  final String nameEn;
  final String nameAr;
  final String imageUrl;
  final double price;
  final double discount;
  final int count;
  final String description;
  final int subCategoryId;
  final int pharmacyId;
  final String status;
  const Medicine({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.count,
    required this.description,
    required this.subCategoryId,
    required this.pharmacyId,
    required this.status,
  });

  Medicine copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? image,
    double? price,
    double? discount,
    int? count,
    String? description,
    int? subCategoryId,
    int? pharmacyId,
    String? status,
  }) {
    return Medicine(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      imageUrl: image ?? imageUrl,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      count: count ?? this.count,
      description: description ?? this.description,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_en': nameEn,
      'name_ar': nameAr,
      'image_url': imageUrl,
      'price': price,
      'discount': discount,
      'count': count,
      'description': description,
      'sub_category_id': subCategoryId,
      'pharmacy_id': pharmacyId,
      'status': status,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'] as int,
      nameEn: map['name_en'] as String,
      nameAr: map['name_ar'] as String,
      imageUrl: map['image_url'] as String,
      price: double.parse(map['price'].toString()),
      discount: double.parse(map['discount'].toString()),
      count: map['count'] as int,
      description: map['description'] as String,
      subCategoryId: map['sub_category_id'] as int,
      pharmacyId: map['pharmacy_id'] as int,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) =>
      Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'Medicine(id: $id, nameEn: $nameEn, nameAr: $nameAr, image: $imageUrl, price: $price,discount: $discount count: $count, description: $description, subCategoryId: $subCategoryId, pharmacyId: $pharmacyId, status: $status)';
  // }
  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      nameEn,
      nameAr,
      imageUrl,
      price,
      discount,
      count,
      description,
      subCategoryId,
      pharmacyId,
      status,
    ];
  }
}
