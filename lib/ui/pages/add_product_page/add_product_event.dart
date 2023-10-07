import 'package:equatable/equatable.dart';

abstract class AddProductEvent extends Equatable {}

class ChangeTabEvent extends AddProductEvent {
  final int value;

  ChangeTabEvent({required this.value});
  @override
  List<Object?> get props => [value];
}
