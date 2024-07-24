class VariationGroupModel {
  String name;
  List<VariationModel> variations;

  VariationGroupModel({
    this.name = '',
    required this.variations,
  });

  VariationGroupModel copyWith({
    String? name,
    List<VariationModel>? variations,
  }) {
    return VariationGroupModel(
      name: name ?? this.name,
      variations: variations ?? this.variations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'variations': variations.map((v) => v.toMap()).toList(),
    };
  }

  factory VariationGroupModel.fromMap(Map<String, dynamic> map) {
    return VariationGroupModel(
      name: map['name'] ?? '',
      variations: List<VariationModel>.from(
          map['variations']?.map((x) => VariationModel.fromMap(x)) ?? []),
    );
  }
}

class VariationModel {
  String name;
  num price;
  num cutPrice;
  bool selected;
  String addonName;
  List<AddonModel> addons;

  VariationModel({
    this.name = '',
    this.price = 0,
    this.cutPrice = 0,
    this.addonName = '',
    this.selected = false,
    required this.addons,
  });

  VariationModel copyWith({
    String? name,
    num? price,
    num? cutPrice,
    String? addonName,
    bool? selected,
    List<AddonModel>? addons,
  }) {
    return VariationModel(
      name: name ?? this.name,
      price: price ?? this.price,
      cutPrice: cutPrice ?? this.cutPrice,
      selected: selected ?? this.selected,
      addonName: addonName ?? this.addonName,
      addons: addons ?? this.addons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'cutPrice': cutPrice,
      'selected': selected,
      'addonName': addonName,
      'addons': addons.map((a) => a.toMap()).toList(),
    };
  }

  factory VariationModel.fromMap(Map<String, dynamic> map) {
    return VariationModel(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      cutPrice: map['cutPrice'] ?? 0,
      addonName: map['addonName'] ?? '',
      addons: List<AddonModel>.from(
          map['addons']?.map((x) => AddonModel.fromMap(x)) ?? []),
    );
  }
}

class AddonModel {
  String name;
  num price;
  num cutPrice;
  bool selected;

  AddonModel({
    this.name = '',
    this.price = 0,
    this.cutPrice = 0,
    this.selected = false,
  });

  AddonModel copyWith({
    String? name,
    num? price,
    num? cutPrice,
    bool? selected,
  }) {
    return AddonModel(
      name: name ?? this.name,
      price: price ?? this.price,
      cutPrice: cutPrice ?? this.cutPrice,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'cutPrice': cutPrice,
      'selected': selected,
    };
  }

  factory AddonModel.fromMap(Map<String, dynamic> map) {
    return AddonModel(
      name: map['name'] ?? '',
      price: map['price'] ?? 0,
      cutPrice: map['cutPrice'] ?? 0,
    );
  }
}
