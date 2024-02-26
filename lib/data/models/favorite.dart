// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'medicine.dart';

class FavoritePagination extends Equatable {
  final int? currentPage;
  final int? lastPage;
  final int? from;
  final int? to;
  final int perPage;
  final int total;
  final List<Favorite>? favorites;
  const FavoritePagination({
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
    required this.perPage,
    required this.total,
    this.favorites,
  });

  FavoritePagination copyWith({
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    int? perPage,
    int? total,
    List<Favorite>? favorites,
  }) {
    return FavoritePagination(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      favorites: favorites ?? this.favorites,
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
      'data': favorites!.map((x) => x.toMap()).toList(),
    };
  }

  factory FavoritePagination.fromMap(Map<String, dynamic> map) {
    return FavoritePagination(
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      lastPage: map['last_page'] != null ? map['last_page'] as int : null,
      from: map['from'] != null ? map['from'] as int : null,
      to: map['to'] != null ? map['to'] as int : null,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      favorites: map['data'] != null
          ? List<Favorite>.from(
              (map['data']).map<Favorite?>(
                (x) => Favorite.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritePagination.fromJson(String source) =>
      FavoritePagination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      currentPage!,
      lastPage!,
      from!,
      to!,
      perPage,
      total,
      favorites!,
    ];
  }
}

class Favorite extends Equatable {
  final String id;
  final int medicineId;
  final String createdAt;
  final Medicine medicine;
  const Favorite({
    required this.id,
    required this.medicineId,
    required this.createdAt,
    required this.medicine,
  });

  Favorite copyWith(
      {String? id, int? medicineId, String? createdAt, Medicine? medicine}) {
    return Favorite(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      createdAt: createdAt ?? this.createdAt,
      medicine: medicine ?? this.medicine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'medicine_id': medicineId,
      'created_at': createdAt,
      'medicine': medicine,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'] as String,
      medicineId: map['medicine_id'] as int,
      createdAt: map['created_at'] as String,
      medicine: Medicine.fromMap(map['medicine'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, medicineId, createdAt, medicine];
}
