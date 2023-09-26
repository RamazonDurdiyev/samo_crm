import 'package:equatable/equatable.dart';

abstract class AddProductState extends Equatable {}

class Initial extends AddProductState {
  @override
  List<Object?> get props => [];
}

class ShowDialogState extends AddProductState {
  final State state;

  ShowDialogState({required this.state});
  @override
  List<Object?> get props => [state];
}

class ChangeTabState extends AddProductState {
  final State state;

  ChangeTabState({required this.state});
  @override
  List<Object?> get props => [state];
}

enum State { initial, loading, loaded, error }
