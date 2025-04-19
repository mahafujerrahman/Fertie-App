class NotificationModel {
  final String id;
  final String userId;
  final String receiverId;
  final String bookingId;
  final String title;
  final String body;
  final String type;
  final Metadata metadata;
  final bool isRead;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.receiverId,
    required this.bookingId,
    required this.title,
    required this.body,
    required this.type,
    required this.metadata,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['_id'],
      userId: json['userId'],
      receiverId: json['receiverId'],
      bookingId: json['bookingId'],
      title: json['title'],
      body: json['body'],
      type: json['type'],
      metadata: Metadata.fromJson(json['metadata']),
      isRead: json['isRead'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'receiverId': receiverId,
      'bookingId': bookingId,
      'title': title,
      'body': body,
      'type': type,
      'metadata': metadata.toJson(),
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}

class Metadata {
  final String carId;

  Metadata({required this.carId});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      carId: json['carId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carId': carId,
    };
  }
}
