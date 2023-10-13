import 'package:equatable/equatable.dart';

abstract class RemoveProductState extends Equatable {}

class Initial extends RemoveProductState {
  @override
  List<Object?> get props => [];
}

class ChangeRemoveTabState extends RemoveProductState {
  final State state;

  ChangeRemoveTabState({required this.state});
  @override
  List<Object?> get props => [state];
}

class TryToExpandRemovePageState extends RemoveProductState {
  final State state;

  TryToExpandRemovePageState({required this.state});
  @override
  List<Object?> get props => [state];
}

enum State {
  initial,
  loading,
  loaded,
  error,
}
