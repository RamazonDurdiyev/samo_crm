import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int? id;
  final String? name;
  final String? imageUrl;
  final List<ProductItemModel>? children;

  ProductModel({
    this.id,
    this.name,
    this.imageUrl,
    this.children,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      _$ProductModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ProductItemModel {
  final int? id;
  final String? name;
  final String? imageUrl;

  ProductItemModel({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory ProductItemModel.fromJson(Map<String, dynamic> data) =>
      _$ProductItemModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProductItemModelToJson(this);
}