class HourlyDataModel {
  final int hour;
  int orderCount;
  double totalValue;

  HourlyDataModel({
    required this.hour,
    this.orderCount = 0,
    this.totalValue = 0.0,
  });

  factory HourlyDataModel.fromMap(Map<String, dynamic> map) {
    return HourlyDataModel(
      hour: map['hour'] as int,
      orderCount: map['order_count'] as int,
      totalValue: map['total_value'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hour': hour,
      'order_count': orderCount,
      'total_value': totalValue,
    };
  }

  HourlyDataModel copyWith({
    int? hour,
    int? orderCount,
    double? totalValue,
  }) {
    return HourlyDataModel(
      hour: hour ?? this.hour,
      orderCount: orderCount ?? this.orderCount,
      totalValue: totalValue ?? this.totalValue,
    );
  }
}
