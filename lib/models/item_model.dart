class ItemModel {
  String id;
  String name;
  String? image;
  double price;
  int quantity;
  List<Map<String, dynamic>> variationGroups;

  ItemModel({
    required this.id,
    required this.name,
    this.image,
    required this.price,
    required this.quantity,
    required this.variationGroups,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      quantity: map['quantity'],
      variationGroups: List<Map<String, dynamic>>.from(map['variation_groups']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'variation_groups': variationGroups,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ItemModel) return false;
    return name == other.name && variationGroups == other.variationGroups;
  }

  @override
  int get hashCode => name.hashCode ^ variationGroups.hashCode;
}
