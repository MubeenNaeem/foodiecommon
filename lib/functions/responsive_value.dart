import 'package:flutter/material.dart';
import 'package:foodiecommon/global/utils.dart';

T responsiveValue<T>(BuildContext context, Map<int, T> map) {
  for (var entry in map.entries) {
    if (width(context) <= entry.key) return entry.value;
  }
  return map.values.first;
}
