import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Validation on String {
  bool isValidEmail() {
    return RegExp(
      r"^[a-zA-Z0-9a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }

  bool isValidPhone() {
    return RegExp(
      r"^[0-9]{10}$",
    ).hasMatch(this);
  }
}

extension StringExtension on String {
  String toProperCase() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get beautify {
    return toProperCase().replaceAll('_', ' ');
  }

  String get snackCase {
    return toLowerCase().replaceAll(' ', '_');
  }

  TimeOfDay get timeOfDay {
    return TimeOfDay(
      hour: int.parse(split(':')[0]),
      minute: int.parse(split(':')[1]),
    );
  }
}

extension DateExtensions on DateTime {
  String get formatDate {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  bool get isToday {
    final now = DateTime.now();
    return (year == now.year && month == now.month && day == now.day);
  }

  bool isSameDate(DateTime other) {
    return (year == other.year && month == other.month && day == other.day);
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day + 1);
  }

  DateTime get firstDayOfWeek {
    final day = subtract(Duration(days: weekday - 1));
    return DateTime(day.year, day.month, day.day);
  }

  DateTime getNextTime() {
    var nextMinute = minute < 30 ? 30 : 0;
    var nextHour = minute < 30 ? hour : hour + 1;
    return copyWith(hour: nextHour, minute: nextMinute);
  }
}

extension TimeExtensions on TimeOfDay {
  String get string {
    return '${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')}';
  }
}

extension EmptyExtension on String? {
  bool get isEmptyOrNull {
    if (this == null) return true;
    if (this == '') return true;
    return false;
  }
}

extension ColorExtension on Color {
  Color get light => Color.alphaBlend(
        withOpacity(0.1),
        Colors.white,
      );

  Color get medium => Color.alphaBlend(
        withOpacity(0.17),
        Colors.white,
      );

  Color blend(double o) => Color.alphaBlend(
        withOpacity(o),
        Colors.white,
      );
}

extension NumberExtension on num {
  num get convertNumber {
    if (this == roundToDouble()) return toInt();
    return this;
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E value) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(index++, element);
    }
  }
}
