import 'package:equatable/equatable.dart';

abstract class ProductsCartState extends Equatable{}

class Initial extends ProductsCartState{
  @override
  List<Object?> get props => [];
}

class TryToExpandState extends ProductsCartState {
  final State state;

  TryToExpandState({required this.state});
  @override
  List<Object?> get props => [state];
}


enum State {initial,loading,loaded,error}