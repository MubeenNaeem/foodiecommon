import 'package:flutter/services.dart';

TextInputFormatter get numberFormatter => NumberInputFormatter(
      RegExp(r'^(?!^\.)(?:[0-9]+\.?|[0-9]*\.?[0-9]*)?$'),
    );

class NumberInputFormatter extends TextInputFormatter {
  final RegExp regex;

  NumberInputFormatter(this.regex);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}
