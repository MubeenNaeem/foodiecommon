class RiderModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final List<int> branches;
  final int ordersAssigned;
  final int ordersDelivered;
  final DateTime? lastDelivered;

  RiderModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.branches,
    this.ordersAssigned = 0,
    this.ordersDelivered = 0,
    this.lastDelivered,
  });

  factory RiderModel.fromMap(Map<String, dynamic> map) {
    return RiderModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      branches: [...map['branches']],
      ordersAssigned: map['ordersAssigned'] ?? 0,
      ordersDelivered: map['ordersDelivered'] ?? 0,
      lastDelivered: map['lastDelivered'] != null
          ? DateTime.parse(map['lastDelivered'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'branches': branches,
      'ordersAssigned': ordersAssigned,
      'ordersDelivered': ordersDelivered,
      'lastDelivered': lastDelivered?.toIso8601String(),
    };
  }

  RiderModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    List<int>? branches,
    int? ordersAssigned,
    int? ordersDelivered,
    DateTime? lastDelivered,
  }) {
    return RiderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      branches: branches ?? this.branches,
      ordersAssigned: ordersAssigned ?? this.ordersAssigned,
      ordersDelivered: ordersDelivered ?? this.ordersDelivered,
      lastDelivered: lastDelivered ?? this.lastDelivered,
    );
  }
}
