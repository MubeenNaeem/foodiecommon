import 'package:flutter/material.dart';

double width(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double height(BuildContext context) {
  return MediaQuery.sizeOf(context).height;
}

Future navigateNamed(context, String to, {arguments}) {
  return Navigator.of(context).pushNamed(to, arguments: arguments);
}

Future navigateRemove(context, Widget to) async {
  return await Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => to),
    (route) => false,
  );
}

void pop(context, [Object? value]) {
  Navigator.of(context).pop(value);
}

Future navigate(context, Widget to) async {
  return await Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => to),
  );
}
