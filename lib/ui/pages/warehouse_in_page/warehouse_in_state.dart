import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class WarehouseInState extends Equatable {}

class Initial extends WarehouseInState {
  @override
  List<Object?> get props => [];
}

class ShowDialogState extends WarehouseInState {
  final State state;

  ShowDialogState({required this.state});
  @override
  List<Object?> get props => [state];
}

class ChangeTabState extends WarehouseInState {
  final State state;

  ChangeTabState({required this.state});
  @override
  List<Object?> get props => [state,UniqueKey()];
}

enum State {
  initial,
  loading,
  loaded,
  error,
}
