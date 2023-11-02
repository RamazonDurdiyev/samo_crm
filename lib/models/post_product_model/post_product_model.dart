import 'package:json_annotation/json_annotation.dart';
part 'post_product_model.g.dart';

@JsonSerializable()
class PostProductModel {
  final int? purchasePlaceId;
  final int? productId;
  final int? quantity;
  final int? price;

  PostProductModel({
    this.purchasePlaceId,
    this.productId,
    this.quantity,
    this.price,
  });

  factory PostProductModel.fromJson(Map<String, dynamic> data) =>
      _$PostProductModelFromJson(data);

  Map<String, dynamic> toJson() => _$PostProductModelToJson(this);
}