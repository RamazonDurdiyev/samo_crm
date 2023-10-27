import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int? id;
  final String? name;
  final String? imageUrl;
  final List? children;

  CategoryModel({
    this.id,
    this.name,
    this.imageUrl,
    this.children,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> data) =>
      _$CategoryModelFromJson(data);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
