class AddressModel {
  final int id;
  final String name;
  final String address;
  final double longitude;
  final double latitude;

  AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.longitude,
    required this.latitude,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      longitude: map['longitude'],
      latitude: map['latitude'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  AddressModel copyWith({
    int? id,
    String? name,
    String? address,
    double? longitude,
    double? latitude,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }
}
