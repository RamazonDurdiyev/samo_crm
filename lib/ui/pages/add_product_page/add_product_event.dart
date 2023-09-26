import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddProductEvent extends Equatable {}

class ShowDialogEvent extends AddProductEvent {
  final BuildContext context;

  ShowDialogEvent({required this.context});
  @override
  List<Object?> get props => [context];
}

class ChangeTabEvent extends AddProductEvent {
  final int value;

  ChangeTabEvent({required this.value});
  @override
  List<Object?> get props => [value];
}
