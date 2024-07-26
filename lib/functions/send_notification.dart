import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map> sendNotification({
  required String appId,
  required String apiKey,
  required String title,
  required String message,
  String? userId,
}) async {
  const url = 'https://api.onesignal.com/notifications?c=push';

  final response = await http.post(
    Uri.parse(url),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Basic $apiKey",
    },
    body: jsonEncode(
      {
        "app_id": appId,
        "headings": {"en": title},
        "contents": {"en": message},
        if (userId == null) "included_segments": ["all-users"],
        if (userId != null)
          "include_aliases": {
            "external_id": [userId],
          },
        "target_channel": "push"
      },
    ),
  );

  return jsonDecode(response.body);
}
