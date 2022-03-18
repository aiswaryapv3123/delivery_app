// To parse this JSON data, do
//
//     final getNotifications = getNotificationsFromJson(jsonString);

import 'dart:convert';

GetNotifications getNotificationsFromJson(String str) =>
    GetNotifications.fromJson(json.decode(str));

String getNotificationsToJson(GetNotifications data) =>
    json.encode(data.toJson());

class GetNotifications {
  GetNotifications({
    this.success,
    this.data,
    this.message,
  });

  final bool? success;
  final List<Datum>? data;
  final String? message;

  factory GetNotifications.fromJson(Map<String, dynamic> json) =>
      GetNotifications(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
    this.customFields,
  });

  final String? id;
  final Type? type;
  final NotifiableType? notifiableType;
  final int? notifiableId;
  final String? data;
  final dynamic readAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? customFields;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: typeValues.map![json["type"]],
        notifiableType: notifiableTypeValues.map![json["notifiable_type"]],
        notifiableId: json["notifiable_id"],
        data: json["data"],
        readAt: json["read_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "notifiable_type": notifiableTypeValues.reverse[notifiableType],
        "notifiable_id": notifiableId,
        "data": data,
        "read_at": readAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
      };
}

enum NotifiableType { APP_MODELS_USER }

final notifiableTypeValues =
    EnumValues({"App\\Models\\User": NotifiableType.APP_MODELS_USER});

enum Type { APP_NOTIFICATIONS_ASSIGNED_ORDER }

final typeValues = EnumValues({
  "App\\Notifications\\AssignedOrder": Type.APP_NOTIFICATIONS_ASSIGNED_ORDER
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
