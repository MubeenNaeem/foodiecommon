import 'package:foodiecommon/models/order_model.dart';

class ReviewModel {
  final int id;
  final double stars;
  final String review;
  final OrderModel? order;

  ReviewModel({
    required this.id,
    required this.stars,
    required this.review,
    this.order,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: map['id'],
      stars: map['stars'],
      review: map['review'],
      order: map['order'] != null ? OrderModel.fromMap(map['order']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stars': stars,
      'review': review,
      'order': order?.toMap(),
    };
  }

  ReviewModel copyWith({
    int? id,
    double? stars,
    String? review,
    OrderModel? order,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      stars: stars ?? this.stars,
      review: review ?? this.review,
      order: order ?? this.order,
    );
  }
}
