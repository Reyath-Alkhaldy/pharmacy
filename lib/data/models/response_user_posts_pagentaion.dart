// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'medicine.dart';

class ResponseUserMedicinePagenation {
  final String? status;
  final String? message;
  final Data? data;
  ResponseUserMedicinePagenation({
    this.status,
    this.message,
    this.data,
  });

  ResponseUserMedicinePagenation copyWith({
    String? status,
    String? message,
    Data? data,
  }) {
    return ResponseUserMedicinePagenation(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'medicine': data?.toMap(),
    };
  }

  factory ResponseUserMedicinePagenation.fromMap(Map<String, dynamic> map) {
    return ResponseUserMedicinePagenation(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['medicine'] != null
          ? Data.fromMap(map['medicine'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseUserMedicinePagenation.fromJson(String source) =>
      ResponseUserMedicinePagenation.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResponseUserMedicinePagenation(status: $status, message: $message, medicine: $data)';

  @override
  bool operator ==(covariant ResponseUserMedicinePagenation other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class Data {
  Data({
    this.currentPage,
    this.medicine,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });
  final int? currentPage;
  final List<Medicine>? medicine;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  Data copyWith({
    int? currentPage,
    List<Medicine>? medicine,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) {
    return Data(
      currentPage: currentPage ?? this.currentPage,
      medicine: medicine ?? this.medicine,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'data': medicine!.map((x) => x.toMap()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links!.map((x) => x.toMap()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      medicine: map['data'] != null
          ? List<Medicine>.from(
              (map['data']).map<Medicine?>(
                (x) => Medicine.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      firstPageUrl: map['first_page_url'] != null
          ? map['first_page_url'] as String
          : null,
      from: map['from'] != null ? map['from'] as int : null,
      lastPage: map['last_page'] != null ? map['last_page'] as int : null,
      lastPageUrl:
          map['last_page_url'] != null ? map['last_page_url'] as String : null,
      links: map['links'] != null
          ? List<Links>.from(
              (map['links']).map<Links?>(
                (x) => Links.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      nextPageUrl:
          map['next_page_url'] != null ? map['next_page_url'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      perPage: map['per_page'] != null ? map['per_page'] as int : null,
      prevPageUrl:
          map['prev_page_url'] != null ? map['prev_page_url'] as String : null,
      to: map['to'] != null ? map['to'] as int : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(currentPage: $currentPage, data: $medicine, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, links: $links, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.currentPage == currentPage &&
        listEquals(other.medicine, medicine) &&
        other.firstPageUrl == firstPageUrl &&
        other.from == from &&
        other.lastPage == lastPage &&
        other.lastPageUrl == lastPageUrl &&
        listEquals(other.links, links) &&
        other.nextPageUrl == nextPageUrl &&
        other.path == path &&
        other.perPage == perPage &&
        other.prevPageUrl == prevPageUrl &&
        other.to == to &&
        other.total == total;
  }

  @override
  int get hashCode {
    return currentPage.hashCode ^
        medicine.hashCode ^
        firstPageUrl.hashCode ^
        from.hashCode ^
        lastPage.hashCode ^
        lastPageUrl.hashCode ^
        links.hashCode ^
        nextPageUrl.hashCode ^
        path.hashCode ^
        perPage.hashCode ^
        prevPageUrl.hashCode ^
        to.hashCode ^
        total.hashCode;
  }
}

class Links {
  Links({
    this.url,
    this.label,
    this.active,
  });
  final String? url;
  final String? label;
  final bool? active;

  Links copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return Links(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'label': label,
      'active': active,
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      url: map['url'] != null ? map['url'] as String : null,
      label: map['label'] != null ? map['label'] as String : null,
      active: map['active'] != null ? map['active'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) =>
      Links.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Links(url: $url, label: $label, active: $active)';

  @override
  bool operator ==(covariant Links other) {
    if (identical(this, other)) return true;

    return other.url == url && other.label == label && other.active == active;
  }

  @override
  int get hashCode => url.hashCode ^ label.hashCode ^ active.hashCode;
}
