// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:new_maps/data/models/medicine.dart';

class OrderPagination extends Equatable {
  final int currentPage;
  final int lastPage;
  final int from;
  final int to;
  final int perPage;
  final int total;
  final List<Order> orders;
  const OrderPagination({
    required this.currentPage,
    required this.lastPage,
    required this.from,
    required this.to,
    required this.perPage,
    required this.total,
    required this.orders,
  });

  OrderPagination copyWith({
    int? currentPage,
    int? lastPage,
    int? from,
    int? to,
    int? perPage,
    int? total,
    List<Order>? order,
  }) {
    return OrderPagination(
      currentPage: currentPage ?? this.currentPage,
      lastPage: lastPage ?? this.lastPage,
      from: from ?? this.from,
      to: to ?? this.to,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      orders: order ?? this.orders,
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
      'data': orders.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderPagination.fromMap(Map<String, dynamic> map) {
    return OrderPagination(
      currentPage: map['current_page'] as int,
      lastPage: map['last_page'] as int,
      from: map['from'] as int,
      to: map['to'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      orders: List<Order>.from(
        (map['data']).map<Order>(
          (x) => Order.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderPagination.fromJson(String source) =>
      OrderPagination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      currentPage,
      lastPage,
      from,
      to,
      perPage,
      total,
      orders,
    ];
  }
}

class Order extends Equatable {
  final int id;
  final int? userId;
  final int pharmacyId;
  final String number;
  final String paymentMethod;
  final String paymentStatus;
  final String status;
  final double tax;
  final double discount;
  final double total;
  final String createdAt;
  final List<Medicine>? medicines;
  const Order({
    required this.id,
    this.userId,
    required this.pharmacyId,
    required this.number,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.status,
    required this.tax,
    required this.discount,
    required this.total,
    required this.createdAt,
    this.medicines,
  });

  Order copyWith({
    int? id,
    int? userId,
    int? pharmacyId,
    String? number,
    String? paymentMethod,
    String? paymentStatus,
    String? status,
    double? tax,
    double? discount,
    double? total,
    String? createdAt,
    List<Medicine>? medicines,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      number: number ?? this.number,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      status: status ?? this.status,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      medicines: medicines ?? this.medicines,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'pharmacy_id': pharmacyId,
      'number': number,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
      'status': status,
      'tax': tax,
      'discount': discount,
      'total': total,
      'created_at': createdAt,
      'medicines': medicines!.map((medicine) => medicine.toMap()).toList(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    //  "id": 3,
    //     "pharmacy_id": 3,
    //     "user_id": 11,
    //     "number": "202400003",
    //     "payment_method": "cod",
    //     "status": "pending",
    //     "payment_status": "pending",
    //     "tax": "0.00",
    //     "discount": "0.00",
    //     "total": "4253.32",
    //     "created_at": "2024-02-23T19:21:19.000000Z",
    //     "updated_at": "2024-02-23T19:21:19.000000Z",
    //     "medicines": [
    return Order(
      id: map['id'] as int,
      userId: map['user_id'] != null ? map['user_id'] as int : null,
      pharmacyId: map['pharmacy_id'] as int,
      number: map['number'] as String,
      paymentMethod: map['payment_method'] as String,
      paymentStatus: map['payment_status'] as String,
      status: map['status'] as String,
      tax: double.parse(map['tax'].toString()),
      discount: double.parse(map['discount'].toString()),
      total: double.parse(map['total'].toString()),
      createdAt: map['created_at'] as String,
      medicines: map['medicines'] != null
          ? List<Medicine>.from(
              (map['medicines']).map<Medicine>(
                (x) => Medicine.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId!,
      pharmacyId,
      number,
      paymentMethod,
      paymentStatus,
      status,
      tax,
      discount,
      total,
      createdAt,
      medicines!,
    ];
  }
}
