class BranchModel {
  final int id;
  final String name;
  final String address;
  final String city;
  final String country;
  final String phone;
  final double longitude;
  final double latitude;
  final double taxPercentageCash;
  final double taxPercentageCard;
  final bool deliveryActive;
  final bool pickupActive;

  BranchModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    required this.phone,
    required this.longitude,
    required this.latitude,
    required this.taxPercentageCash,
    required this.taxPercentageCard,
    required this.deliveryActive,
    required this.pickupActive,
  });

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      city: map['city'],
      country: map['country'],
      phone: map['phone'],
      longitude: map['longitude'],
      latitude: map['latitude'],
      taxPercentageCash: map['tax_percentage_cash'],
      taxPercentageCard: map['tax_percentage_card'],
      deliveryActive: map['delivery_active'],
      pickupActive: map['pickup_active'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'country': country,
      'phone': phone,
      'longitude': longitude,
      'latitude': latitude,
      'tax_percentage_cash': taxPercentageCash,
      'tax_percentage_card': taxPercentageCard,
      'delivery_active': deliveryActive,
      'pickup_active': pickupActive,
    };
  }

  BranchModel copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    String? country,
    String? phone,
    double? longitude,
    double? latitude,
    double? taxPercentageCash,
    double? taxPercentageCard,
    bool? deliveryActive,
    bool? pickupActive,
  }) {
    return BranchModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      taxPercentageCash: taxPercentageCash ?? this.taxPercentageCash,
      taxPercentageCard: taxPercentageCard ?? this.taxPercentageCard,
      deliveryActive: deliveryActive ?? this.deliveryActive,
      pickupActive: pickupActive ?? this.pickupActive,
    );
  }
}
