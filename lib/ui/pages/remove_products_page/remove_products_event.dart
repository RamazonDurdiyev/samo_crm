import 'package:equatable/equatable.dart';

abstract class RemoveProductEvent extends Equatable {}

class ChangeRemoveTabEvent extends RemoveProductEvent {
  final int value;

  ChangeRemoveTabEvent({required this.value});
  @override
  List<Object?> get props => [value];
}

class TryToExpandRemovePageEvent extends RemoveProductEvent{
  final int index;

  TryToExpandRemovePageEvent({required this.index});
  @override
  List<Object?> get props => [index];
}