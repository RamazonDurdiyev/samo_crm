import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable{}

class FetchHistoriesEvent extends HistoryEvent{
  @override
  List<Object?> get props => [];
}