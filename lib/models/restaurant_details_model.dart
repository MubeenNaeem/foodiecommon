import 'package:flutter/material.dart';
import 'package:foodiecommon/global/extensions.dart';

class RestaurantDetails {
  final int id;
  final String name;
  final double deliveryCharges;
  final double minimumOrderAmount;
  final double deliveryRadius;
  final int refreshTime;
  final List<WorkingHours> workingHours;
  final String message;
  final String phone;
  final String email;
  final String address;
  final String logo;
  final String currency;
  final List<String> orderTypes;
  final List<String> pickupPaymentMethods;
  final List<String> deliveryPaymentMethods;
  final int loyaltyPointRate;
  final int minimumLoyaltyPoints;

  RestaurantDetails({
    required this.id,
    required this.name,
    required this.deliveryCharges,
    required this.minimumOrderAmount,
    required this.deliveryRadius,
    required this.refreshTime,
    required this.workingHours,
    required this.message,
    required this.phone,
    required this.email,
    required this.address,
    required this.logo,
    required this.currency,
    required this.orderTypes,
    required this.pickupPaymentMethods,
    required this.deliveryPaymentMethods,
    required this.loyaltyPointRate,
    required this.minimumLoyaltyPoints,
  });

  factory RestaurantDetails.fromMap(Map<String, dynamic> map) {
    return RestaurantDetails(
      id: map['id'],
      name: map['name'],
      deliveryCharges: map['delivery_charges'],
      minimumOrderAmount: map['minimum_order_amount'],
      deliveryRadius: map['delivery_radius'],
      refreshTime: map['refresh_time'],
      workingHours: List<WorkingHours>.from(
          map['working_hours']?.map((x) => WorkingHours.fromMap(x))),
      message: map['message'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'],
      logo: map['logo'],
      currency: map['currency'],
      loyaltyPointRate: map['loyalty_point_rate'],
      minimumLoyaltyPoints: map['minimum_loyalty_points'],
      orderTypes: List<String>.from(map['order_types']),
      pickupPaymentMethods: List<String>.from(map['pickup_payment_methods']),
      deliveryPaymentMethods:
          List<String>.from(map['delivery_payment_methods']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'delivery_charges': deliveryCharges,
      'minimum_order_amount': minimumOrderAmount,
      'delivery_radius': deliveryRadius,
      'refresh_time': refreshTime,
      'working_hours': workingHours.map((x) => x.toMap()).toList(),
      'message': message,
      'phone': phone,
      'email': email,
      'address': address,
      'logo': logo,
      'currency': currency,
      'order_types': orderTypes,
      'pickup_payment_methods': pickupPaymentMethods,
      'delivery_payment_methods': deliveryPaymentMethods,
      'loyalty_point_rate': loyaltyPointRate,
      'minimum_loyalty_points': minimumLoyaltyPoints,
    };
  }

  RestaurantDetails copyWith({
    int? id,
    String? name,
    double? deliveryCharges,
    double? minimumOrderAmount,
    double? deliveryRadius,
    int? refreshTime,
    List<WorkingHours>? workingHours,
    String? message,
    String? phone,
    String? email,
    String? address,
    String? logo,
    String? currency,
    List<String>? orderTypes,
    List<String>? paymentMethods,
    List<String>? pickupPaymentMethods,
    List<String>? deliveryPaymentMethods,
    int? loyaltyPointRate,
    int? minimumLoyaltyPoints,
  }) {
    return RestaurantDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      deliveryCharges: deliveryCharges ?? this.deliveryCharges,
      minimumOrderAmount: minimumOrderAmount ?? this.minimumOrderAmount,
      deliveryRadius: deliveryRadius ?? this.deliveryRadius,
      refreshTime: refreshTime ?? this.refreshTime,
      workingHours: workingHours ?? this.workingHours,
      message: message ?? this.message,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      logo: logo ?? this.logo,
      currency: currency ?? this.currency,
      orderTypes: orderTypes ?? this.orderTypes,
      pickupPaymentMethods: paymentMethods ?? this.pickupPaymentMethods,
      deliveryPaymentMethods:
          deliveryPaymentMethods ?? this.deliveryPaymentMethods,
      loyaltyPointRate: loyaltyPointRate ?? this.loyaltyPointRate,
      minimumLoyaltyPoints: minimumLoyaltyPoints ?? this.minimumLoyaltyPoints,
    );
  }
}

class WorkingHours {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final bool open;

  WorkingHours({
    required this.startTime,
    required this.endTime,
    required this.open,
  });

  factory WorkingHours.fromMap(Map<String, dynamic> map) {
    return WorkingHours(
      startTime: map['start_time'].toString().timeOfDay,
      endTime: map['end_time'].toString().timeOfDay,
      open: map['open'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'start_time': startTime.string,
      'end_time': endTime.string,
      'open': open,
    };
  }

  WorkingHours copyWith({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
    bool? open,
  }) {
    return WorkingHours(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      open: open ?? this.open,
    );
  }
}
