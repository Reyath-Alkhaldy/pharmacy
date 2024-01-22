import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:new_maps/data/models/pharmacy.dart';

var paginates = {
  "current_page": 1,
  "data": [],
  "first_page_url": "http://localhost:8000/api/pharmacies?page=1",
  "from": 1,
  "last_page": 4,
  "last_page_url": "http://localhost:8000/api/pharmacies?page=4",
  "links": [
    {"url": null, "label": "&laquo; Previous", "active": false},
    {
      "url": "http://localhost:8000/api/pharmacies?page=1",
      "label": "1",
      "active": true
    },
    {
      "url": "http://localhost:8000/api/pharmacies?page=2",
      "label": "2",
      "active": false
    },
    {
      "url": "http://localhost:8000/api/pharmacies?page=3",
      "label": "3",
      "active": false
    },
    {
      "url": "http://localhost:8000/api/pharmacies?page=4",
      "label": "4",
      "active": false
    },
    {
      "url": "http://localhost:8000/api/pharmacies?page=2",
      "label": "Next &raquo;",
      "active": false
    }
  ],
  "next_page_url": "http://localhost:8000/api/pharmacies?page=2",
  "path": "http://localhost:8000/api/pharmacies",
  "per_page": 5,
  "prev_page_url": null,
  "to": 5,
  "total": 20
};

class PharmacyPagination extends Equatable {
  final List<Doctor> pharmacies;
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
    List<Doctor>? pharmacies,
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
      pharmacies: List<Doctor>.from(
        (map['data']).map<Doctor>(
          (x) => Doctor.fromMap(x as Map<String, dynamic>),
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

class Linkes extends Equatable {
  final String? url;
  final String label;
  final bool active;
  const Linkes({
    this.url,
    required this.label,
    required this.active,
  });

  Linkes copyWith({
    String? url,
    String? label,
    bool? active,
  }) {
    return Linkes(
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

  factory Linkes.fromMap(Map<String, dynamic> map) {
    return Linkes(
      url: map['url'] != null ? map['url'] as String : null,
      label: map['label'] as String,
      active: map['active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Linkes.fromJson(String source) =>
      Linkes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [url!, label, active];
}
