class BannerModel {
  final int id;
  final String? name;
  final String image;
  final bool active;

  BannerModel({
    required this.id,
    this.name,
    required this.image,
      this.active = true,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      active: map['active'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'active': active,
    };
  }

  BannerModel copyWith({
    int? id,
    String? name,
    String? image,
    bool? active,
  }) {
    return BannerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      active: active ?? this.active,
    );
  }
}
