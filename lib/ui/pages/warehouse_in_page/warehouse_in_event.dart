import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WarehouseInEvent extends Equatable {}

class ShowDialogEvent extends WarehouseInEvent {
  final BuildContext context;

  ShowDialogEvent({required this.context});
  @override
  List<Object?> get props => [context];
}
class ChangeTabEvent extends WarehouseInEvent{
  @override
  List<Object?> get props => [];
  
}