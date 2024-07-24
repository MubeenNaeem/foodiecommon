import 'dart:convert';
import 'dart:math';

import 'package:nanoid/nanoid.dart';

void main() {
  print(nanoid(16));
  print(nanoid(16));
}

String generateRandomUTFKey([int length = 16]) {
  final random = Random.secure();
  final List<int> bytes = List.generate(length, (_) => random.nextInt(256));
  return utf8.decode(bytes);
}
