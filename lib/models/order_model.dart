import 'package:foodiecommon/models/address_model.dart';
import 'package:foodiecommon/models/branch_model.dart';
import 'package:foodiecommon/models/customer_model.dart';
import 'package:foodiecommon/models/review_model.dart';
import 'package:foodiecommon/models/rider_model.dart';

class OrderModel {
  final int id;
  final CustomerModel? customer;
  final RiderModel? rider;
  final BranchModel? branch;
  final DateTime orderTime;
  final DateTime? processingTime;
  final DateTime? shippedTime;
  final DateTime? readyTime;
  final DateTime? pickupTime;
  final DateTime? deliveryTime;
  final String status;
  final num? subtotal;
  final num? tax;
  final num? deliveryCharges;
  final num totalAmount;
  final String paymentMethod;
  final AddressModel? address;
  final ReviewModel? review;
  final List items;
  final String? notes;
  final String orderType;
  final num? loyaltyPoints;
  final num? discount;
  final String? platform;
  final bool newCustomer;

  OrderModel({
    required this.id,
    this.customer,
    this.rider,
    this.branch,
    required this.orderTime,
    this.processingTime,
    this.shippedTime,
    this.readyTime,
    this.pickupTime,
    this.deliveryTime,
    required this.status,
    this.subtotal,
    this.tax,
    this.deliveryCharges,
    required this.totalAmount,
    required this.paymentMethod,
    this.address,
    this.review,
    required this.items,
    this.notes,
    required this.orderType,
    this.loyaltyPoints,
    this.discount,
    this.platform,
    this.newCustomer = true,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      customer: map['customer'] != null
          ? CustomerModel.fromMap(map['customer'])
          : null,
      rider: map['rider'] != null ? RiderModel.fromMap(map['rider']) : null,
      branch: map['branch'] != null ? BranchModel.fromMap(map['branch']) : null,
      orderTime: DateTime.parse(map['order_time']),
      processingTime: map['processing_time'] != null
          ? DateTime.parse(map['processing_time'])
          : null,
      shippedTime: map['shipped_time'] != null
          ? DateTime.parse(map['shipped_time'])
          : null,
      readyTime:
          map['ready_time'] != null ? DateTime.parse(map['ready_time']) : null,
      pickupTime: map['pickup_time'] != null
          ? DateTime.parse(map['pickup_time'])
          : null,
      deliveryTime: map['delivery_time'] != null
          ? DateTime.parse(map['delivery_time'])
          : null,
      status: map['status'],
      subtotal: map['subtotal'] ?? 0,
      tax: map['tax'] ?? 0,
      deliveryCharges: map['delivery_charges'] ?? 0,
      totalAmount: map['total_amount'],
      paymentMethod: map['payment_method'],
      address:
          map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      review: map['review'] != null ? ReviewModel.fromMap(map['review']) : null,
      items: map['items'],
      notes: map['notes'],
      orderType: map['order_type'],
      loyaltyPoints: map['loyalty_points'] ?? 0,
      discount: map['discount'] ?? 0,
      platform: map['platform'],
      newCustomer: map['new_customer'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer': customer?.toMap(),
      'rider': rider?.toMap(),
      'branch': branch?.toMap(),
      'order_time': orderTime.toIso8601String(),
      'processing_time': processingTime?.toIso8601String(),
      'shipped_time': shippedTime?.toIso8601String(),
      'ready_time': readyTime?.toIso8601String(),
      'pickup_time': pickupTime?.toIso8601String(),
      'delivery_time': deliveryTime?.toIso8601String(),
      'status': status,
      'subtotal': subtotal,
      'tax': tax,
      'delivery_charges': deliveryCharges,
      'total_amount': totalAmount,
      'payment_method': paymentMethod,
      'address': address?.toMap(),
      'review': review?.toMap(),
      'items': items,
      'notes': notes,
      'order_type': orderType,
      'loyalty_points': loyaltyPoints,
      'discount': discount,
      'platform': platform,
      'new_customer': newCustomer,
    };
  }

  OrderModel copyWith({
    int? id,
    CustomerModel? customer,
    RiderModel? rider,
    BranchModel? branch,
    DateTime? orderTime,
    DateTime? processingTime,
    DateTime? shippedTime,
    DateTime? readyTime,
    DateTime? pickupTime,
    DateTime? deliveryTime,
    String? status,
    num? subtotal,
    num? tax,
    num? deliveryCharges,
    num? totalAmount,
    String? paymentMethod,
    AddressModel? address,
    ReviewModel? review,
    List? items,
    String? notes,
    String? orderType,
    String? platform,
    num? loyaltyPoints,
    num? discount,
    bool? newCustomer,
  }) {
    return OrderModel(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      rider: rider ?? this.rider,
      branch: branch ?? this.branch,
      orderTime: orderTime ?? this.orderTime,
      processingTime: processingTime ?? this.processingTime,
      shippedTime: shippedTime ?? this.shippedTime,
      readyTime: readyTime ?? this.readyTime,
      pickupTime: pickupTime ?? this.pickupTime,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      deliveryCharges: deliveryCharges ?? this.deliveryCharges,
      totalAmount: totalAmount ?? this.totalAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      address: address ?? this.address,
      review: review ?? this.review,
      items: items ?? this.items,
      notes: notes ?? this.notes,
      orderType: orderType ?? this.orderType,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      discount: discount ?? this.discount,
      platform: platform ?? this.platform,
      newCustomer: newCustomer ?? this.newCustomer,
    );
  }
}
