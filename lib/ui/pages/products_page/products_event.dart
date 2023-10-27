import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {}

class ChangeProductsTabEvent extends ProductsEvent {
  final int value;

  ChangeProductsTabEvent({required this.value});

  @override
  List<Object?> get props => [value];
}

class FetchCategoriesEvent extends ProductsEvent{
  @override
  List<Object?> get props => [];
}


