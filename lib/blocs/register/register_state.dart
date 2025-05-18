part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {
  final UserModel? user;
  const RegisterInitial(this.user);
  @override
  List<Object> get props => [user ?? ''];
}

final class RegisterSuccess extends RegisterState {
  final String message;
  const RegisterSuccess(this.message);
  
  @override
  List<Object> get props => [message];
}

final class RegisterError extends RegisterState {
  final String message;
  const RegisterError(this.message);
  
  @override
  List<Object> get props => [message];
}