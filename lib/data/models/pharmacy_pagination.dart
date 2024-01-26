// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
class PharmacyPagination extends Equatable {
  final List<Pharmacy> pharmacies;
  final int currentPage;
  final int from;
  final int to;
  final int lastPage;
  final String path;
  final String firstPageUrl;
  final String lastPageUrl;
  final String? nextPageUrl;
  final String? prevPageUrl;
  final int perPage;
  final int total;
  const PharmacyPagination({
    required this.pharmacies,
    required this.currentPage,
    required this.from,
    required this.to,
    required this.lastPage,
    required this.path,
    required this.firstPageUrl,
    required this.lastPageUrl,
    this.nextPageUrl,
    this.prevPageUrl,
    required this.perPage,
    required this.total,
  });

  PharmacyPagination copyWith({
    List<Pharmacy>? pharmacies,
    int? currentPage,
    int? from,
    int? to,
    int? lastPage,
    String? path,
    String? firstPageUrl,
    String? lastPageUrl,
    String? nextPageUrl,
    String? prevPageUrl,
    int? perPage,
    int? total,
  }) {
    return PharmacyPagination(
      pharmacies: pharmacies ?? this.pharmacies,
      currentPage: currentPage ?? this.currentPage,
      from: from ?? this.from,
      to: to ?? this.to,
      lastPage: lastPage ?? this.lastPage,
      path: path ?? this.path,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': pharmacies.map((x) => x.toMap()).toList(),
      'current_page': currentPage,
      'from': from,
      'to': to,
      'last_page': lastPage,
      'path': path,
      'first_page_url': firstPageUrl,
      'last_page_url': lastPageUrl,
      'next_page_url': nextPageUrl,
      'prev_page_url': prevPageUrl,
      'per_page': perPage,
      'total': total,
    };
  }

  factory PharmacyPagination.fromMap(Map<String, dynamic> map) {
    return PharmacyPagination(
      pharmacies: List<Pharmacy>.from(
        (map['data']).map<Pharmacy>(
          (x) => Pharmacy.fromMap(x as Map<String, dynamic>),
        ),
      ),
      currentPage: map['current_page'] as int,
      from: map['from'] as int,
      to: map['to'] as int,
      lastPage: map['last_page'] as int,
      path: map['path'] as String,
      firstPageUrl: map['first_page_url'] as String,
      lastPageUrl: map['last_page_url'] as String,
      nextPageUrl:
          map['next_page_url'] != null ? map['next_page_url'] as String : null,
      prevPageUrl:
          map['prev_page_url'] != null ? map['prev_page_url'] as String : null,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PharmacyPagination.fromJson(String source) =>
      PharmacyPagination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      pharmacies,
      currentPage,
      from,
      to,
      lastPage,
      path,
      firstPageUrl,
      lastPageUrl,
      nextPageUrl!,
      prevPageUrl!,
      perPage,
      total,
    ];
  }
}
class Pharmacy extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String image;
  final City city;
  const Pharmacy({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.image,
    required this.city,
  });

  Pharmacy copyWith({
    int? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
    String? image,
    City? city,
  }) {
    return Pharmacy(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      image: image ?? this.image,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'image': image,
      'city': city.toMap(),
    };
  }

  factory Pharmacy.fromMap(Map<String, dynamic> map) {
    return Pharmacy(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phone_number'] as String,
      address: map['address'] as String,
      image: map['image'] as String,
      city: City.fromMap(map['city'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pharmacy.fromJson(String source) => Pharmacy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      phoneNumber,
      address,
      image,
      city,
    ];
  }
}
class City extends Equatable {
  final int id;
  final String name;
  final String zipCode;
  const City({
    required this.id,
    required this.name,
    required this.zipCode,
  });

  City copyWith({
    int? id,
    String? name,
    String? zipCode,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'zip_code': zipCode,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] as int,
      name: map['name'] as String,
      zipCode: map['zip_code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, zipCode];
}
