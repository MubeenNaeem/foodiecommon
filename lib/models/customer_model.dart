class CustomerModel {
  final String id;
  final String name;
  final String phone;
  final String? email;
  final String? image;
  final DateTime? lastOrdered;
  final int orders;
  final double amountSpent;
  final double loyaltyPoints;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    this.email,
    this.image,
    this.lastOrdered,
    this.orders = 0,
    this.amountSpent = 0.00,
    this.loyaltyPoints = 0.00,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      image: map['image'],
      lastOrdered: map['last_ordered'] != null
          ? DateTime.parse(map['last_ordered'])
          : null,
      orders: map['orders'] ?? 0,
      amountSpent: map['amount_spent'] ?? 0.00,
      loyaltyPoints: map['loyalty_points'] ?? 0.00,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
      'last_ordered': lastOrdered?.toIso8601String(),
      'orders': orders,
      'amount_spent': amountSpent,
      'loyalty_points': loyaltyPoints,
    };
  }

  CustomerModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? image,
    DateTime? lastOrdered,
    int? orders,
    double? amountSpent,
    double? loyaltyPoints,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      lastOrdered: lastOrdered ?? this.lastOrdered,
      orders: orders ?? this.orders,
      amountSpent: amountSpent ?? this.amountSpent,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
    );
  }
}
