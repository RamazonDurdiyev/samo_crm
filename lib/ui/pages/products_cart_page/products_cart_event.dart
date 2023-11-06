import 'package:equatable/equatable.dart';
import 'package:samo_crm/models/product_model/product_model.dart';

abstract class ProductsCartEvent extends Equatable{}

class TryToExpandEvent extends ProductsCartEvent {
  final int index;

  TryToExpandEvent({required this.index});
  @override
  List<Object?> get props => [index];
}

class GetLocalProductsEvent extends ProductsCartEvent{
  @override
  List<Object?> get props => [];
}

class DeleteLocalProductEvent extends ProductsCartEvent{
 final CartProductModel product;

  DeleteLocalProductEvent({required this.product});
  @override
  List<Object?> get props => [product];
}

class SortProductsEvent extends ProductsCartEvent{
  // final List<String> products;
  final String categoryName;

  SortProductsEvent({ required this.categoryName});
  @override
  List<Object?> get props => [categoryName];
}