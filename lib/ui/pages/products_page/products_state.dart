import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable{}

class Initial extends ProductsState{
  @override
  List<Object?> get props => [];
}

class ChangeProductsTabState extends ProductsState{

  final State state;

  ChangeProductsTabState({required this.state});
  @override
  List<Object?> get props => [state];
}

class FetchCategoriesState extends ProductsState{
  final State state;

  FetchCategoriesState({required this.state});
  @override
  List<Object?> get props => [state];
}

enum State{initial,loading,loaded,error}