import 'package:foodiecommon/models/order_model.dart';

String getOrderId(OrderModel order) {
  int number = order.orderTime.millisecondsSinceEpoch;

  int length = 8;
  const String chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const int base = chars.length;

  List<int> encoded = List<int>.filled(length, 0);

  for (int i = length - 1; i >= 0; i--) {
    encoded[i] = number % base;
    number ~/= base;
  }

  final id = String.fromCharCodes(
    encoded.map((index) => chars.codeUnitAt(index)),
  );

  return '${id.substring(0, 4)}-${id.substring(4)}';
}
