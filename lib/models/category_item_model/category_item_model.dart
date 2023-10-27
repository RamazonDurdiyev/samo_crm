import 'package:json_annotation/json_annotation.dart';
part 'category_item_model.g.dart';

@JsonSerializable()
class CategoryItemModel {
  final int? id;
  final String? name;
  final String? imageUrl;

  CategoryItemModel({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> data) =>
      _$CategoryItemModelFromJson(data);

  Map<String, dynamic> toJson() => _$CategoryItemModelToJson(this);
}
