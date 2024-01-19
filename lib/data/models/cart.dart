import 'dart:convert';
import 'package:equatable/equatable.dart';

class CartResponse extends Equatable {
  final String status;
  final List<Cart> carts;
  final double total;
  const CartResponse({
    required this.status,
    required this.carts,
    required this.total,
  });

  CartResponse copyWith({
    String? status,
    List<Cart>? carts,
    double? total,
  }) {
    return CartResponse(
      status: status ?? this.status,
      carts: carts ?? this.carts,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'carts': carts.map((x) => x.toMap()).toList(),
      'total': total,
    };
  }

  factory CartResponse.fromMap(Map<String, dynamic> map) {
    return CartResponse(
      status: map['status'] as String,
      carts: List<Cart>.from(
        (map['carts']).map<Cart>(
          (x) => Cart.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: double.parse(map['total'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartResponse.fromJson(String source) =>
      CartResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, carts, total];
}

class Cart extends Equatable {
  final String id;
  final int pharmacyId;
  final int medicineId;
  final int quantity;
  final MedicineCart medicine;
  const Cart({
    required this.id,
    required this.pharmacyId,
    required this.medicineId,
    required this.quantity,
    required this.medicine,
  });

  Cart copyWith({
    String? id,
    int? pharmacyId,
    int? medicineId,
    int? quantity,
    MedicineCart? medicine,
  }) {
    return Cart(
      id: id ?? this.id,
      pharmacyId: pharmacyId ?? this.pharmacyId,
      medicineId: medicineId ?? this.medicineId,
      quantity: quantity ?? this.quantity,
      medicine: medicine ?? this.medicine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pharmacy_id': pharmacyId,
      'medicine_id': medicineId,
      'quantity': quantity,
      'medicine': medicine.toMap(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] as String,
      pharmacyId: map['pharmacy_id'] as int,
      medicineId: map['medicine_id'] as int,
      quantity: map['quantity'] as int,
      medicine: MedicineCart.fromMap(map['medicine'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      pharmacyId,
      medicineId,
      quantity,
      medicine,
    ];
  }
}

class MedicineCart extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final int count;
  final double discount;
  final double price;
  final String imageUrl;
  const MedicineCart({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.count,
    required this.discount,
    required this.price,
    required this.imageUrl,
  });

  MedicineCart copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    int? count,
    double? discount,
    double? price,
    String? imageUrl,
  }) {
    return MedicineCart(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      count: count ?? this.count,
      discount: discount ?? this.discount,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'count': count,
      'discount': discount,
      'price': price,
      'image_url': imageUrl,
    };
  }

  factory MedicineCart.fromMap(Map<String, dynamic> map) {
    return MedicineCart(
      id: map['id'] as int,
      nameAr: map['name_ar'] as String,
      nameEn: map['name_en'] as String,
      count: map['count'] as int,
      discount: double.parse(map['discount'].toString()),
      price: double.parse(map['price'].toString()),
      imageUrl: map['image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicineCart.fromJson(String source) =>
      MedicineCart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      nameAr,
      nameEn,
      count,
      discount,
      price,
      imageUrl,
    ];
  }
}
