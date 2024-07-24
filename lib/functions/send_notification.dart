import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendNotification(
  String serverKey, {
  required String topic,
  required String title,
  required String body,
}) async {
  const postUrl = 'https://fcm.googleapis.com/fcm/send';

  String toParams = "/topics/$topic";

  final data = {
    "notification": {"body": body, "title": title},
    "priority": "high",
    "data": {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "id": "1",
      "status": "done",
      "sound": 'default',
      "screen": topic,
    },
    "to": toParams
  };

  final headers = {
    'content-type': 'application/json',
    'Authorization': 'key=$serverKey'
  };

  await http.post(
    Uri.parse(postUrl),
    body: json.encode(data),
    encoding: Encoding.getByName('utf-8'),
    headers: headers,
  );
}
