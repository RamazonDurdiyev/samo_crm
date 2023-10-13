import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable{}

class Initial extends SignInState{
  @override
 
  List<Object?> get props => [];
}

enum State {initial,loading,loaded,error}