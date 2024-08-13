// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionItemModel _$SubscriptionItemModelFromJson(
        Map<String, dynamic> json) =>
    SubscriptionItemModel(
      id: (json['id'] as num).toInt(),
      subscriptionId: (json['subscription_id'] as num).toInt(),
      productId: json['product_id'] as String,
      priceId: json['price_id'] as String,
      status: json['status'] as String,
      quantity: (json['quantity'] as num).toInt(),
      subscriptionDate: DateTime.parse(json['created_at'] as String),
      isActive: BunnySyncJsonUtils.isActiveFromJson(
          JsonUtils.readValue(json, 'isActive') as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionItemModelToJson(
        SubscriptionItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscription_id': instance.subscriptionId,
      'product_id': instance.productId,
      'price_id': instance.priceId,
      'status': instance.status,
      'quantity': instance.quantity,
      'created_at': instance.subscriptionDate.toIso8601String(),
      'isActive': instance.isActive,
    };
