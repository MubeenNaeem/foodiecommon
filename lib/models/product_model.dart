import 'package:foodiecommon/models/category_model.dart';
import 'package:foodiecommon/models/variation_model.dart';

class ProductModel {
  int id;
  String name;
  String description;
  double price;
  List<VariationGroupModel> variationGroups;
  String image;
  String badge;
  CategoryModel category;
  bool active;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.description = '',
    required this.variationGroups,
    this.image = '',
    this.badge = '',
    required this.category,
    this.active = true,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      variationGroups: List<VariationGroupModel>.from(
        (map['variation_groups'] as List)
            .map((x) => VariationGroupModel.fromMap(x)),
      ),
      image: map['image'],
      badge: map['badge'],
      category: CategoryModel.fromMap(map['category']),
      active: map['active'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'variations': variationGroups.map((v) => v.toMap()).toList(),
      'image': image,
      'badge': badge,
      'category': category.toMap(),
      'active': active,
    };
  }

  ProductModel copyWith({
    int? id,
    String? name,
    double? price,
    String? description,
    List<VariationGroupModel>? variationGroups,
    String? image,
    String? badge,
    CategoryModel? category,
    bool? active,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      variationGroups: variationGroups ?? this.variationGroups,
      image: image ?? this.image,
      badge: badge ?? this.badge,
      category: category ?? this.category,
      active: active ?? this.active,
    );
  }
}
