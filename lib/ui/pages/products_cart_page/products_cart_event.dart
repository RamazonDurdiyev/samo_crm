import 'package:equatable/equatable.dart';

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