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
  List<Object?> get props => [];
}

enum State {
  initial,
  loading,
  loaded,
  error,
}