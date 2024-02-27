// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class UsersConsultationPagination extends Equatable {
  final int? currentPage;
  final int? lastPage;
  final int? from;
  final int? to;
  final int perPage;
  final int total;
  final List<User> users;
  const UsersConsultationPagination({
    this.currentPage,
    this.lastPage,
    this.from,
    this.to,
    required this.perPage,
    required this.total,
    required this.users,
  });

  UsersConsultationPagination copyWith({
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    int? perPage,
    int? total,
    List<User>? users,
  }) {
    return UsersConsultationPagination(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      users: users ?? this.users,
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
      'data': users.map((x) => x.toMap()).toList(),
    };
  }

  factory UsersConsultationPagination.fromMap(Map<String, dynamic> map) {
    return UsersConsultationPagination(
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      lastPage: map['last_page'] != null ? map['last_page'] as int : null,
      from: map['from'] != null ? map['from'] as int : null,
      to: map['to'] != null ? map['to'] as int : null,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      users: map['data'] != null || map['data'].isNotEmpty
          ? List<User>.from(
              (map['data']).map<User?>(
                (x) => User.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersConsultationPagination.fromJson(String source) =>
      UsersConsultationPagination.fromMap(
          json.decode(source) as Map<String, dynamic>);

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
      users,
    ];
  }
}

// class UsersConsultation extends Equatable {
//   final int id;
//   final String text;
//   final String imageUrl;
//   final String type;
//   final String createdAt;
//   final int userId;
//   final int doctorId;
//   final User user;
//   const UsersConsultation({
//     required this.id,
//     required this.text,
//     required this.imageUrl,
//     required this.type,
//     required this.createdAt,
//     required this.userId,
//     required this.doctorId,
//     required this.user,
//   });

//   UsersConsultation copyWith({
//     int? id,
//     String? text,
//     String? imageUrl,
//     String? type,
//     String? createdAt,
//     int? userId,
//     int? doctorId,
//     User? user,
//   }) {
//     return UsersConsultation(
//       id: id ?? this.id,
//       text: text ?? this.text,
//       imageUrl: imageUrl ?? this.imageUrl,
//       type: type ?? this.type,
//       createdAt: createdAt ?? this.createdAt,
//       userId: userId ?? this.userId,
//       doctorId: doctorId ?? this.doctorId,
//       user: user ?? this.user,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'text': text,
//       'image_url': imageUrl,
//       'type': type,
//       'created_at': createdAt,
//       'user_id': userId,
//       'doctor_id': doctorId,
//       'user': user.toMap(),
//     };
//   }

//   factory UsersConsultation.fromMap(Map<String, dynamic> map) {
//     return UsersConsultation(
//       id: map['id'] as int,
//       text: map['text'] != null ? map['text'] as String : '',
//       imageUrl: map['image_url'] != null ? map['image_url'] as String : '',
//       type: map['type'] as String,
//       createdAt: map['created_at'] as String,
//       userId: map['user_id'] as int,
//       doctorId: map['doctor_id'] as int,
//       user: User.fromMap(map['user'] as Map<String, dynamic>),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory UsersConsultation.fromJson(String source) =>
//       UsersConsultation.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   bool get stringify => true;

//   @override
//   List<Object> get props {
//     return [
//       id,
//       text,
//       imageUrl,
//       type,
//       createdAt,
//       userId,
//       doctorId,
//       user,
//     ];
//   }
// }
