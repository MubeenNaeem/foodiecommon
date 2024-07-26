class NotificationModel {
  final int id;
  final String title;
  final String message;
  final String notificationId;
  final DateTime sentAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.notificationId,
    required this.sentAt,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'],
      title: map['title'],
      message: map['message'],
      notificationId: map['notification_id'],
      sentAt: DateTime.parse(map['sent_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'notification_id': notificationId,
      'sent_at': sentAt.toIso8601String(),
    };
  }

  NotificationModel copyWith({
    int? id,
    String? title,
    String? message,
    String? notificationId,
    DateTime? sentAt,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      notificationId: notificationId ?? this.notificationId,
      sentAt: sentAt ?? this.sentAt,
    );
  }
}
