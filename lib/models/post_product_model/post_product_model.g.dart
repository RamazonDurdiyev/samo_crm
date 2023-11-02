// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostProductModel _$PostProductModelFromJson(Map<String, dynamic> json) =>
    PostProductModel(
      purchasePlaceId: json['purchasePlaceId'] as int?,
      productId: json['productId'] as int?,
      quantity: json['quantity'] as int?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$PostProductModelToJson(PostProductModel instance) =>
    <String, dynamic>{
      'purchasePlaceId': instance.purchasePlaceId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'price': instance.price,
    };
