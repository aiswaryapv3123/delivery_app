// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.success,
    this.data,
    this.message,
  });

  final bool? success;
  final Data? data;
  final String? message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data!.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.apiToken,
    this.deviceToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.trialEndsAt,
    this.braintreeId,
    this.paypalEmail,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.hasMedia,
    this.media,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? apiToken;
  final String? deviceToken;
  final dynamic stripeId;
  final dynamic cardBrand;
  final dynamic cardLastFour;
  final dynamic trialEndsAt;
  final dynamic braintreeId;
  final dynamic paypalEmail;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final CustomFields? customFields;
  final bool? hasMedia;
  final List<Media>? media;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    apiToken: json["api_token"],
    deviceToken: json["device_token"],
    stripeId: json["stripe_id"],
    cardBrand: json["card_brand"],
    cardLastFour: json["card_last_four"],
    trialEndsAt: json["trial_ends_at"],
    braintreeId: json["braintree_id"],
    paypalEmail: json["paypal_email"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: CustomFields.fromJson(json["custom_fields"]),
    hasMedia: json["has_media"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "api_token": apiToken,
    "device_token": deviceToken,
    "stripe_id": stripeId,
    "card_brand": cardBrand,
    "card_last_four": cardLastFour,
    "trial_ends_at": trialEndsAt,
    "braintree_id": braintreeId,
    "paypal_email": paypalEmail,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "custom_fields": customFields!.toJson(),
    "has_media": hasMedia,
    "media": List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class CustomFields {
  CustomFields({
    this.phone,
    this.bio,
    this.address,
    this.verifiedPhone,
  });

  final Address? phone;
  final Address? bio;
  final Address? address;
  final Address? verifiedPhone;

  factory CustomFields.fromJson(Map<String, dynamic> json) => CustomFields(
    phone: Address.fromJson(json["phone"]),
    bio: Address.fromJson(json["bio"]),
    address: Address.fromJson(json["address"]),
    verifiedPhone: Address.fromJson(json["verifiedPhone"]),
  );

  Map<String, dynamic> toJson() => {
    "phone": phone!.toJson(),
    "bio": bio!.toJson(),
    "address": address!.toJson(),
    "verifiedPhone": verifiedPhone!.toJson(),
  };
}

class Address {
  Address({
    this.value,
    this.view,
    this.name,
  });

  final String? value;
  final String? view;
  final String? name;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    value: json["value"] == null ? null : json["value"],
    view: json["view"] == null ? null : json["view"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : value,
    "view": view == null ? null : view,
    "name": name,
  };
}

class Media {
  Media({
    this.id,
    this.modelType,
    this.modelId,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.thumb,
    this.icon,
    this.formatedSize,
  });

  final int? id;
  final String? modelType;
  final int? modelId;
  final String? collectionName;
  final String? name;
  final String? fileName;
  final String? mimeType;
  final String? disk;
  final int? size;
  final List<dynamic>? manipulations;
  final CustomProperties? customProperties;
  final List<dynamic>? responsiveImages;
  final int? orderColumn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? url;
  final String? thumb;
  final String? icon;
  final String? formatedSize;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    modelType: json["model_type"],
    modelId: json["model_id"],
    collectionName: json["collection_name"],
    name: json["name"],
    fileName: json["file_name"],
    mimeType: json["mime_type"],
    disk: json["disk"],
    size: json["size"],
    manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
    customProperties: CustomProperties.fromJson(json["custom_properties"]),
    responsiveImages: List<dynamic>.from(json["responsive_images"].map((x) => x)),
    orderColumn: json["order_column"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    url: json["url"],
    thumb: json["thumb"],
    icon: json["icon"],
    formatedSize: json["formated_size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_type": modelType,
    "model_id": modelId,
    "collection_name": collectionName,
    "name": name,
    "file_name": fileName,
    "mime_type": mimeType,
    "disk": disk,
    "size": size,
    "manipulations": List<dynamic>.from(manipulations!.map((x) => x)),
    "custom_properties": customProperties!.toJson(),
    "responsive_images": List<dynamic>.from(responsiveImages!.map((x) => x)),
    "order_column": orderColumn,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "url": url,
    "thumb": thumb,
    "icon": icon,
    "formated_size": formatedSize,
  };
}

class CustomProperties {
  CustomProperties({
    this.uuid,
    this.userId,
    this.generatedConversions,
  });

  final String? uuid;
  final int? userId;
  final GeneratedConversions? generatedConversions;

  factory CustomProperties.fromJson(Map<String, dynamic> json) => CustomProperties(
    uuid: json["uuid"],
    userId: json["user_id"],
    generatedConversions: GeneratedConversions.fromJson(json["generated_conversions"]),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "user_id": userId,
    "generated_conversions": generatedConversions!.toJson(),
  };
}

class GeneratedConversions {
  GeneratedConversions({
    this.thumb,
    this.icon,
  });

  final bool? thumb;
  final bool? icon;

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) => GeneratedConversions(
    thumb: json["thumb"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "thumb": thumb,
    "icon": icon,
  };
}
