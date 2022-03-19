// To parse this JSON data, do
//
//     final getRecentOrder = getRecentOrderFromJson(jsonString);

import 'dart:convert';

GetRecentOrder getRecentOrderFromJson(String str) => GetRecentOrder.fromJson(json.decode(str));

String getRecentOrderToJson(GetRecentOrder data) => json.encode(data.toJson());

class GetRecentOrder {
  GetRecentOrder({
    this.success,
    this.data,
    this.message,
  });

  final bool? success;
  final List<Data>? data;
  final String? message;

  factory GetRecentOrder.fromJson(Map<String, dynamic> json) => GetRecentOrder(
    success: json["success"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Data {
  Data({
    this.id,
    this.userId,
    this.orderStatusId,
    this.tax,
    this.deliveryFee,
    this.hint,
    this.active,
    this.driverId,
    this.deliveryAddressId,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.driver,
    this.productOrders,
    this.orderStatus,
    this.deliveryAddress,
    this.payment,
  });

  final int? id;
  final int? userId;
  final int? orderStatusId;
  final int? tax;
  final int? deliveryFee;
  final dynamic hint;
  final bool? active;
  final int? driverId;
  final int? deliveryAddressId;
  final int? paymentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? customFields;
  final Driver? driver;
  final List<ProductOrder>? productOrders;
  final OrderStatus? orderStatus;
  final DeliveryAddress? deliveryAddress;
  final Payment? payment;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    orderStatusId: json["order_status_id"],
    tax: json["tax"],
    deliveryFee: json["delivery_fee"],
    hint: json["hint"],
    active: json["active"],
    driverId: json["driver_id"],
    deliveryAddressId: json["delivery_address_id"],
    paymentId: json["payment_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
    driver: Driver.fromJson(json["driver"]),
    productOrders: List<ProductOrder>.from(json["product_orders"].map((x) => ProductOrder.fromJson(x))),
    orderStatus: OrderStatus.fromJson(json["order_status"]),
    deliveryAddress: DeliveryAddress.fromJson(json["delivery_address"]),
    payment: Payment.fromJson(json["payment"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "order_status_id": orderStatusId,
    "tax": tax,
    "delivery_fee": deliveryFee,
    "hint": hint,
    "active": active,
    "driver_id": driverId,
    "delivery_address_id": deliveryAddressId,
    "payment_id": paymentId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
    "driver": driver!.toJson(),
    "product_orders": List<dynamic>.from(productOrders!.map((x) => x.toJson())),
    "order_status": orderStatus!.toJson(),
    "delivery_address": deliveryAddress!.toJson(),
    "payment": payment!.toJson(),
  };
}

class DeliveryAddress {
  DeliveryAddress({
    this.id,
    this.description,
    this.address,
    this.latitude,
    this.longitude,
    this.isDefault,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.customFields,
  });

  final int? id;
  final String? description;
  final String? address;
  final double? latitude;
  final double? longitude;
  final bool? isDefault;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? customFields;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
    id: json["id"],
    description: json["description"] == null ? null : json["description"],
    address: json["address"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    isDefault: json["is_default"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description == null ? null : description,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "is_default": isDefault,
    "user_id": userId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
  };
}

class Driver {
  Driver({
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

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
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

  final Value? value;
  final View? view;
  final String? name;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    value: json["value"] == null ? null : valueValues.map![json["value"]],
    view: json["view"] == null ? null : viewValues.map![json["view"]],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "value": value == null ? null : valueValues.reverse[value],
    "view": view == null ? null : viewValues.reverse[view],
    "name": name,
  };
}

enum Value { THRITHALLOOR_PURATHUR_TIRUR_MALAPPURAM, P_DELIVERY_ADDRESS_P, THE_919746938550 }

final valueValues = EnumValues({
  "<p>Delivery Address</p>": Value.P_DELIVERY_ADDRESS_P,
  "+919746938550": Value.THE_919746938550,
  "Thrithalloor,Purathur,Tirur,Malappuram": Value.THRITHALLOOR_PURATHUR_TIRUR_MALAPPURAM
});

enum View { THRITHALLOOR_PURATHUR_TIRUR_MALAPPURAM, DELIVERY_ADDRESS, THE_919746938550 }

final viewValues = EnumValues({
  "Delivery Address": View.DELIVERY_ADDRESS,
  "+919746938550": View.THE_919746938550,
  "Thrithalloor,Purathur,Tirur,Malappuram": View.THRITHALLOOR_PURATHUR_TIRUR_MALAPPURAM
});

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
  final ModelType? modelType;
  final int? modelId;
  final CollectionName? collectionName;
  final String? name;
  final String? fileName;
  final MimeType? mimeType;
  final Disk? disk;
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
    modelType: modelTypeValues.map![json["model_type"]],
    modelId: json["model_id"],
    collectionName: collectionNameValues.map![json["collection_name"]],
    name: json["name"],
    fileName: json["file_name"],
    mimeType: mimeTypeValues.map![json["mime_type"]],
    disk: diskValues.map![json["disk"]],
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
    "model_type": modelTypeValues.reverse[modelType],
    "model_id": modelId,
    "collection_name": collectionNameValues.reverse[collectionName],
    "name": name,
    "file_name": fileName,
    "mime_type": mimeTypeValues.reverse[mimeType],
    "disk": diskValues.reverse[disk],
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

enum CollectionName { AVATAR, IMAGE }

final collectionNameValues = EnumValues({
  "avatar": CollectionName.AVATAR,
  "image": CollectionName.IMAGE
});

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

enum Disk { PUBLIC }

final diskValues = EnumValues({
  "public": Disk.PUBLIC
});

enum MimeType { IMAGE_PNG }

final mimeTypeValues = EnumValues({
  "image/png": MimeType.IMAGE_PNG
});

enum ModelType { APP_MODELS_USER, APP_MODELS_MARKET, APP_MODELS_PRODUCT }

final modelTypeValues = EnumValues({
  "App\\Models\\Market": ModelType.APP_MODELS_MARKET,
  "App\\Models\\Product": ModelType.APP_MODELS_PRODUCT,
  "App\\Models\\User": ModelType.APP_MODELS_USER
});

class OrderStatus {
  OrderStatus({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.customFields,
  });

  final int? id;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? customFields;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    id: json["id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
  };
}

class Payment {
  Payment({
    this.id,
    this.price,
    this.description,
    this.userId,
    this.status,
    this.method,
    this.createdAt,
    this.updatedAt,
    this.customFields,
  });

  final int? id;
  final double? price;
  final String? description;
  final int? userId;
  final String? status;
  final String? method;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? customFields;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    id: json["id"],
    price: json["price"].toDouble(),
    description: json["description"],
    userId: json["user_id"],
    status: json["status"],
    method: json["method"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "description": description,
    "user_id": userId,
    "status": status,
    "method": method,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
  };
}

class ProductOrder {
  ProductOrder({
    this.id,
    this.price,
    this.quantity,
    this.productId,
    this.orderId,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.product,
  });

  final int? id;
  final int? price;
  final double? quantity;
  final int? productId;
  final int? orderId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? customFields;
  final Product? product;

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
    id: json["id"],
    price: json["price"],
    quantity: json["quantity"].toDouble(),
    productId: json["product_id"],
    orderId: json["order_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "quantity": quantity,
    "product_id": productId,
    "order_id": orderId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
    "product": product!.toJson(),
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.discountPrice,
    this.description,
    this.capacity,
    this.packageItemsCount,
    this.unit,
    this.featured,
    this.deliverable,
    this.marketId,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.customFields,
    this.hasMedia,
    this.market,
    this.media,
  });

  final int? id;
  final String? name;
  final int? price;
  final int? discountPrice;
  final String? description;
  final int? capacity;
  final int? packageItemsCount;
  final String? unit;
  final bool? featured;
  final bool? deliverable;
  final int? marketId;
  final int? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? customFields;
  final bool? hasMedia;
  final Market? market;
  final List<Media>? media;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    discountPrice: json["discount_price"] == null ? null : json["discount_price"],
    description: json["description"],
    capacity: json["capacity"],
    packageItemsCount: json["package_items_count"],
    unit: json["unit"],
    featured: json["featured"],
    deliverable: json["deliverable"],
    marketId: json["market_id"],
    categoryId: json["category_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
    hasMedia: json["has_media"],
    market: Market.fromJson(json["market"]),
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "discount_price": discountPrice == null ? null : discountPrice,
    "description": description,
    "capacity": capacity,
    "package_items_count": packageItemsCount,
    "unit": unit,
    "featured": featured,
    "deliverable": deliverable,
    "market_id": marketId,
    "category_id": categoryId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
    "has_media": hasMedia,
    "market": market!.toJson(),
    "media": List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

class Market {
  Market({
    this.id,
    this.name,
    this.deliveryFee,
    this.address,
    this.phone,
    this.defaultTax,
    this.customFields,
    this.hasMedia,
    this.rate,
    this.media,
  });

  final int? id;
  final String? name;
  final int? deliveryFee;
  final String? address;
  final String? phone;
  final int? defaultTax;
  final List<dynamic>? customFields;
  final bool? hasMedia;
  final String? rate;
  final List<Media>? media;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
    id: json["id"],
    name: json["name"],
    deliveryFee: json["delivery_fee"],
    address: json["address"],
    phone: json["phone"],
    defaultTax: json["default_tax"],
    customFields: List<dynamic>.from(json["custom_fields"].map((x) => x)),
    hasMedia: json["has_media"],
    rate: json["rate"],
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "delivery_fee": deliveryFee,
    "address": address,
    "phone": phone,
    "default_tax": defaultTax,
    "custom_fields": List<dynamic>.from(customFields!.map((x) => x)),
    "has_media": hasMedia,
    "rate": rate,
    "media": List<dynamic>.from(media!.map((x) => x.toJson())),
  };
}

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
